#include <stdint.h>
#include <stdio.h>

#include <gem5/m5ops.h>

/*
 * Harness for synthetic fuzzed kernels that take 4 integer arguments.
 * See harness_synth_1arg.c for the shared conventions (symbol renaming,
 * 64-bit long values, measured region, checksum).
 */

#ifndef ITERS
#define ITERS 10000
#endif

extern long bench_kernel(long, long, long, long);

int
main(void)
{
    uint64_t checksum = 0;
    long a0 = 0x0123456789abcdefL;
    long a1 = 0xfedcba9876543210L;
    long a2 = 0x1032547698badcfeL;
    long a3 = 0xefcdab8967452301L;

    m5_reset_stats(0, 0);
    for (long i = 0; i < ITERS; i++) {
        checksum += (uint64_t)bench_kernel(a0, a1, a2, a3);
        a0 += 0x9e3779b97f4a7c15L; /* vary the inputs across iterations */
        a1 -= 0x7f4a7c15c2b2ae63L;
        a2 ^= (a0 >> 7);
        a3 += (a1 << 3);
    }
    m5_dump_stats(0, 0);

    printf("CHECKSUM: 0x%016llx\n", (unsigned long long)checksum);
    return 0;
}
