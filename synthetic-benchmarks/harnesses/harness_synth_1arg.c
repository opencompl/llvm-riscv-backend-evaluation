#include <stdint.h>
#include <stdio.h>

#include <gem5/m5ops.h>

/*
 * Harness for synthetic fuzzed kernels that take 1 integer argument.
 *
 * Each fuzzed .s file exports its kernel as `main`; the runner
 * (bench_synth.py) renames that symbol to `bench_kernel` before assembling,
 * so it does not collide with this harness's own `main`. The kernels are
 * pure, leaf, register-only functions: rv64 arguments arrive in a0.. and the
 * result comes back in a0, so every value is modelled here as a 64-bit long.
 *
 * The measured region (between m5_reset_stats and m5_dump_stats) calls the
 * kernel ITERS times over varying inputs; the running checksum both keeps the
 * calls from being optimised away and lets callers sanity-check determinism.
 */

#ifndef ITERS
#define ITERS 10000
#endif

extern long bench_kernel(long);

int
main(void)
{
    uint64_t checksum = 0;
    long a0 = 0x0123456789abcdefL;

    m5_reset_stats(0, 0);
    for (long i = 0; i < ITERS; i++) {
        checksum += (uint64_t)bench_kernel(a0);
        a0 += 0x9e3779b97f4a7c15L; /* vary the input across iterations */
    }
    m5_dump_stats(0, 0);

    printf("CHECKSUM: 0x%016llx\n", (unsigned long long)checksum);
    return 0;
}
