#include <libdivide.h>
#include <stdint.h>
#include <stdio.h>

#include <gem5/m5ops.h>

#define NUM_DIVISORS 8
#define NUM_NUMERATORS 128

/*
 * Kernel under test: libdivide_s64_do_raw as lowered by the pipeline
 * under evaluation. bench.py renames the asm entry symbol to
 * 'bench_kernel', so it cannot collide with libdivide.h's static-inline
 * reference implementation (which has a different signature anyway).
 */
extern void bench_kernel(int64_t numer, int64_t magic, uint8_t more,
                         int64_t *out);

/*
 * A mix of divisors chosen to exercise both code paths in do_raw:
 * powers of two hit the shift path (magic == 0); everything else hits
 * the mult path. Mixed signs exercise LIBDIVIDE_NEGATIVE_DIVISOR /
 * LIBDIVIDE_ADD_MARKER handling too.
 */
static const int64_t divisors[NUM_DIVISORS] = {1, -1, 64,      -128,
                                               3, -7, 1000003, -999983};
static struct libdivide_s64_t magics[NUM_DIVISORS];
static int64_t numerators[NUM_NUMERATORS];
static int64_t results[NUM_DIVISORS][NUM_NUMERATORS];

static void
init_numerators(void)
{
    /* Deterministic LCG -- same sequence every run. */
    uint64_t x = 12345;
    for (int i = 0; i < NUM_NUMERATORS; i++) {
        x = x * 6364136223846793005ULL + 1442695040888963407ULL;
        numerators[i] = (int64_t)x;
    }

    /* A few deliberate edge cases. */
    numerators[0] = 0;
    numerators[1] = 1;
    numerators[2] = -1;
    numerators[3] = INT64_MAX;
}

int
main(void)
{
    init_numerators();

    /* Setup: generate the real magic/shift pair for each divisor using
     * the reference header implementation. Not measured -- do_raw is
     * the hot path in real use, gen() runs once per divisor up front. */
    for (int d = 0; d < NUM_DIVISORS; d++) {
        magics[d] = libdivide_s64_gen(divisors[d]);
    }

    /*
     * do_raw's mult-path has a data-dependent correction, `q += (q < 0)`,
     * whose outcome depends on the actual numerator/divisor pair, not
     * just which path (shift vs mult) is taken. Keep both this divisor
     * set and the numerator set identical across every variant you
     * compare, for the same fairness reasons as the earlier kernels.
     */
    m5_reset_stats(0, 0);
    for (int d = 0; d < NUM_DIVISORS; d++) {
        for (int i = 0; i < NUM_NUMERATORS; i++) {
            bench_kernel(numerators[i], magics[d].magic, magics[d].more,
                         &results[d][i]);
        }
    }
    m5_dump_stats(0, 0);

    /* Correctness check against native division; also prevents the
     * results array from being optimized away. */
    volatile int64_t mismatches = 0;
    for (int d = 0; d < NUM_DIVISORS; d++) {
        for (int i = 0; i < NUM_NUMERATORS; i++) {
            int64_t expected = numerators[i] / divisors[d];
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
