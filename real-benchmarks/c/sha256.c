// RUN: ./Tools/vcc -O --emit-mlir %s -o - | filecheck %s
// RUN: ./Tools/vcc -c %s -o %t.o
// RUN: test -s %t.o
// RUN: ./Tools/vcc -S %s -o %t.s
// RUN: test -s %t.s
/*
    SHA-256 block compression function (FIPS 180-4, https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.180-4.pdf), processing one 512-bit block.

    Like fastntt.c / chacha20.c it uses caller-provided buffers, with no local arrays and no globals:
      - H: 8 state words   (read + updated in place)
      - M: 16 message words (the input block)
      - K: 64 round constants
      - W: 64-word scratch  (the message schedule)

    The block compression function is the core part of the SHA-256 hash function, which hashes 
    an arbitrary message by padding it to a multiple of 512 bits and iterating this compression function
    over each 512-bit block. The compression function is the "core" of the hash.

    Some references for the SHA-256 compression function & the algorithm in general:
      - FIPS 180-4: see link above
      - RFC 6234: https://datatracker.ietf.org/doc/html/rfc6234

*/
#include <stdint.h>

// right-rotate a 32-bit word
__attribute__((always_inline)) static uint32_t rotr(uint32_t x, int n) {
    return (x >> n) | (x << (32 - n));}

// message schedule   
__attribute__((always_inline)) void sha256_block(uint32_t *H, const uint32_t *M, const uint32_t *K, uint32_t *W) {
    for (int i = 0; i < 16; i++)
        W[i] = M[i];
    for (int i = 16; i < 64; i++) {
        uint32_t s0 = rotr(W[i-15], 7) ^ rotr(W[i-15], 18) ^ (W[i-15] >> 3);
        uint32_t s1 = rotr(W[i-2], 17) ^ rotr(W[i-2], 19) ^ (W[i-2] >> 10);
        W[i] = W[i-16] + s0 + W[i-7] + s1;
    }

    // compression
    uint32_t a=H[0];
    uint32_t b=H[1];
    uint32_t c=H[2];
    uint32_t d=H[3];
    uint32_t e=H[4];
    uint32_t f=H[5];
    uint32_t g=H[6];
    uint32_t h=H[7];
    for (int i = 0; i < 64; i++) {
        uint32_t S1   = rotr(e,6) ^ rotr(e,11) ^ rotr(e,25);
        uint32_t ch   = (e & f) ^ (~e & g);
        uint32_t t1   = h + S1 + ch + K[i] + W[i];
        uint32_t S0   = rotr(a,2) ^ rotr(a,13) ^ rotr(a,22);
        uint32_t maj  = (a & b) ^ (a & c) ^ (b & c);
        uint32_t t2   = S0 + maj;
        h=g; g=f; f=e; e=d+t1; d=c; c=b; b=a; a=t1+t2;
    }
    H[0]+=a;
    H[1]+=b; 
    H[2]+=c; 
    H[3]+=d; 
    H[4]+=e; 
    H[5]+=f; 
    H[6]+=g; 
    H[7]+=h;
}
