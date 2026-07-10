#include <libdivide.h>
#include <stdint.h>
#include <stdio.h>

#include <gem5/m5ops.h>

#define NUM_DIVISORS 1024

/*
 * Kernel under test: libdivide_internal_s64_gen as lowered by the
 * pipeline under evaluation. bench.py renames the asm entry symbol to
 * 'bench_kernel', so it cannot collide with libdivide.h's static-inline
 * reference implementation (which has a different signature anyway).
 */
extern void bench_kernel(int64_t d, int branchfree,
                         struct libdivide_s64_t *out);

/*
 * Fixed, deterministic divisor set. This function branches on
 * properties of `d` (the power-of-two check, the sign, plus a
 * data-dependent correction inside the general path), so the dynamic
 * instruction/cycle count depends on which divisors you feed it.
 * Keep this array identical across every variant you compare.
 */
static int64_t divisors[NUM_DIVISORS];
static struct libdivide_s64_t results[NUM_DIVISORS];

static void
init_divisors(void)
{
    /* Deterministic LCG -- same sequence every run. */
    uint64_t x = 1;
    for (int i = 0; i < NUM_DIVISORS; i++) {
        x = x * 6364136223846793005ULL + 1442695040888963407ULL;
        int64_t d = (int64_t)(x >> 1); /* avoid INT64_MIN edge case */
        if (x & 1) {
            d = -d; /* mix in negative divisors */
        }
        if (d == 0) {
            d = 1; /* divisor must be non-zero */
        }
        divisors[i] = d;
    }

    /* Force in a few deliberate edge cases: powers of two exercise the
     * shift path, everything else the general path, in both signs. */
    divisors[0] = 1;
    divisors[1] = -1;
    divisors[2] = 64;
    divisors[3] = -128;
    divisors[4] = 3;
    divisors[5] = -7;
}

int
main(void)
{
    init_divisors();

    m5_reset_stats(0, 0);
    for (int i = 0; i < NUM_DIVISORS; i++) {
        /* branchfree = 0: standard (branching) codegen path.
         * Pass 1 instead if you want the branchfree-mode generation. */
        bench_kernel(divisors[i], 0, &results[i]);
    }
    m5_dump_stats(0, 0);

    /* Correctness check against the reference header implementation;
     * also prevents the results array from being optimized away. */
    volatile int64_t mismatches = 0;
    for (int i = 0; i < NUM_DIVISORS; i++) {
        struct libdivide_s64_t ref = libdivide_s64_gen(divisors[i]);
        if (results[i].magic != ref.magic || results[i].more != ref.more) {
            mismatches++;
        }
    }


    /* FNV-1a checksum of the outputs: bench.py compares this line
     * across pipelines to verify they all computed the same result. */
    uint64_t h = 1469598103934665603ULL;
    for (int i = 0; i < NUM_DIVISORS; i++) {
        h ^= (uint64_t)results[i].magic;
        h *= 1099511628211ULL;
        h ^= results[i].more;
        h *= 1099511628211ULL;
    }
    printf("CHECKSUM: 0x%016llx\n", (unsigned long long)h);

    return (int)mismatches;
}
