// RUN: ./Tools/vcc -O --emit-mlir %s -o - | filecheck %s
// RUN: ./Tools/vcc -c %s -o %t.o
// RUN: test -s %t.o
// RUN: ./Tools/vcc -S %s -o %t.s
// RUN: test -s %t.s
/*
    An implementation of the ChaCha20 stream cipher block function (RFC 8439).
    Some refrences:
    - Algorithm: https://cr.yp.to/chacha.htmlhttps://cr.yp.to/chacha/chacha-20080120.pdf
    - RFC 8439: https://datatracker.ietf.org/doc/html/rfc8439

    The structure (state matrix, quarter-round, double-round etc.) follows the public RFC, analog to
    the reference Python implementation at https://github.com/ph4r05/py-chacha20poly1305 (chacha.py).

    Layers:
      - quarter_round: the basic mixing step on four state words
      - chacha20_block: 20 rounds over the 16-word state, producing 64 keystream bytes

*/

#include <stddef.h>
#include <stdint.h>


__attribute__((always_inline)) static uint32_t rotl32(uint32_t x, int n) {
    return (x << n) | (x >> (32 - n));
}

__attribute__((always_inline)) static uint32_t load32le(const uint8_t *p) {
    return (uint32_t)p[0] | ((uint32_t)p[1] << 8) | ((uint32_t)p[2] << 16) | ((uint32_t)p[3] << 24);
}

__attribute__((always_inline)) static void store32le(uint8_t *p, uint32_t v) {
    p[0] = (uint8_t)v;
    p[1] = (uint8_t)(v >> 8);
    p[2] = (uint8_t)(v >> 16);
    p[3] = (uint8_t)(v >> 24);
}

// one ChaCha20 quarter-round on the four state words x[a], x[b], x[c], x[d] (shuffles matrix state)
__attribute__((always_inline)) static void quarter_round(uint32_t *x, int a, int b, int c, int d) {
    x[a]+= x[b]; x[d]^= x[a]; x[d] = rotl32(x[d],16);
    x[c]+= x[d]; x[b]^= x[c]; x[b] = rotl32(x[b],12);
    x[a]+= x[b]; x[d]^= x[a]; x[d] = rotl32(x[d],8);
    x[c]+= x[d]; x[b]^= x[c]; x[b] = rotl32(x[b],7);
}

// produces one 64-byte ChaCha20 keystream block into out
__attribute__((always_inline)) void chacha20_block(const uint8_t *key, uint32_t counter, const uint8_t *nonce, uint8_t *out,
                                                   uint32_t *state, uint32_t *x) {
    state[0] = 0x61707865; // these constants are the ASCII codes of "expand 32-byte k" and fixed in the algo.
    state[1] = 0x3320646e;
    state[2] = 0x79622d32;
    state[3] = 0x6b206574;
    for (long i = 0; i < 8; i++)
        state[4+i] = load32le(key + 4*i);
    state[12] = counter;
    for (long i = 0; i < 3; i++)
        state[13+i] = load32le(nonce + 4*i);

    for (long i = 0; i < 16; i++)
        x[i] = state[i];

    // 20 rounds (10 double rounds each 4 col. rounds then four diag.rounds)
    for (long i = 0; i < 10; i++) {
        quarter_round(x,0,4,8,12);
        quarter_round(x,1,5,9,13);
        quarter_round(x,2,6,10,14);
        quarter_round(x,3,7,11,15);
        quarter_round(x,0,5,10,15);
        quarter_round(x,1,6,11,12);
        quarter_round(x,2,7,8,13);
        quarter_round(x,3,4,9,14);
    }

    for (long i = 0; i < 16; i++)
        store32le(out + 4*i, x[i]+ state[i]);
}
