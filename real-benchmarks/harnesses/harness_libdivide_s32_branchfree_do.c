#include <libdivide.h>
#include <stdint.h>
#include <stdio.h>

#include <gem5/m5ops.h>

#define NUM_DIVISORS 8
#define NUM_NUMERATORS 128

/*
 * Kernel under test: libdivide_s32_branchfree_do as lowered by the
 * pipeline under evaluation. bench.py renames the asm entry symbol to
 * 'bench_kernel', so it cannot collide with libdivide.h's static-inline
 * reference implementation (which has a different signature anyway).
 */
extern void bench_kernel(int32_t numer,
                         const struct libdivide_s32_branchfree_t *denom,
                         int32_t *out);

/*
 * NOTE: libdivide's branchfree path does not support divisors of 1 or -1
 * (the magic-number scheme it uses is undefined for those). Keep 1/-1
 * out of this set -- everything else (powers of two and arbitrary odd
 * values, both signs) is fine.
 */
static const int32_t divisors[NUM_DIVISORS] = {2, -2, 64,      -128,
                                               3, -7, 1000003, -999983};

static struct libdivide_s32_branchfree_t magics[NUM_DIVISORS];
static int32_t numerators[NUM_NUMERATORS];
static int32_t results[NUM_DIVISORS][NUM_NUMERATORS];

static void
init_numerators(void)
{
    /* Deterministic LCG -- same sequence every run. */
    uint64_t x = 12345;
    for (int i = 0; i < NUM_NUMERATORS; i++) {
        x = x * 6364136223846793005ULL + 1442695040888963407ULL;
        numerators[i] = (int32_t)x;
    }

    /* A few deliberate edge cases (0 and INT32_MAX are safe with
     * branchfree; just avoid divisors of +-1, handled above). */
    numerators[0] = 0;
    numerators[1] = 1;
    numerators[2] = -1;
    numerators[3] = INT32_MAX;
}

int
main(void)
{
    init_numerators();

    /* Setup: generate the branchfree magic/shift pair for each divisor
     * using the reference header implementation. Not measured -- gen()
     * runs once per divisor, the divide itself is the hot path. */
    for (int d = 0; d < NUM_DIVISORS; d++) {
        magics[d] = libdivide_s32_branchfree_gen(divisors[d]);
    }

    m5_reset_stats(0, 0);
    for (int d = 0; d < NUM_DIVISORS; d++) {
        for (int i = 0; i < NUM_NUMERATORS; i++) {
            bench_kernel(numerators[i], &magics[d], &results[d][i]);
        }
    }
    m5_dump_stats(0, 0);

    /* Correctness check against native division; also prevents the
     * results array from being optimized away. */
    volatile int32_t mismatches = 0;
    for (int d = 0; d < NUM_DIVISORS; d++) {
        for (int i = 0; i < NUM_NUMERATORS; i++) {
            int32_t expected = numerators[i] / divisors[d];
            if (results[d][i] != expected) {
                mismatches++;
            }
        }
    }


    /* FNV-1a checksum of the outputs: bench.py compares this line
     * across pipelines to verify they all computed the same result. */
    uint64_t h = 1469598103934665603ULL;
    for (int d = 0; d < NUM_DIVISORS; d++) {
        for (int i = 0; i < NUM_NUMERATORS; i++) {
            h ^= (uint64_t)results[d][i];
            h *= 1099511628211ULL;
        }
    }
    printf("CHECKSUM: 0x%016llx\n", (unsigned long long)h);

    return (int)mismatches;
}
