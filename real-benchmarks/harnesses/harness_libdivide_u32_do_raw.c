#include <libdivide.h>
#include <stdint.h>
#include <stdio.h>

#include <gem5/m5ops.h>

#define NUM_DIVISORS 8
#define NUM_NUMERATORS 256

/*
 * Kernel under test: libdivide_u32_do_raw as lowered by the pipeline
 * under evaluation. bench.py renames the asm entry symbol to
 * 'bench_kernel', so it cannot collide with libdivide.h's static-inline
 * reference implementation (which has a different signature anyway).
 */
extern void bench_kernel(uint32_t numer, uint32_t magic, uint8_t more,
                         uint32_t *out);

/*
 * A mix of divisors chosen to exercise both code paths in do_raw:
 * powers of two hit the shift path (magic == 0); everything else hits
 * the mult path (with and without LIBDIVIDE_ADD_MARKER).
 */
static const uint32_t divisors[NUM_DIVISORS] = {1, 2,       64,     128,
                                                3, 1000003, 999983, 4294967291u};
static struct libdivide_u32_t magics[NUM_DIVISORS];
static uint32_t numerators[NUM_NUMERATORS];
static uint32_t results[NUM_DIVISORS][NUM_NUMERATORS];

static void
init_numerators(void)
{
    /* Deterministic LCG -- same sequence every run. */
    uint64_t x = 12345;
    for (int i = 0; i < NUM_NUMERATORS; i++) {
        x = x * 6364136223846793005ULL + 1442695040888963407ULL;
        numerators[i] = (uint32_t)x;
    }

    /* A few deliberate edge cases. */
    numerators[0] = 0;
    numerators[1] = 1;
    numerators[2] = UINT32_MAX;
    numerators[3] = UINT32_MAX - 1;
}

int
main(void)
{
    init_numerators();

    /* Setup: generate the real magic/shift pair for each divisor using
     * the reference header implementation. Not measured -- do_raw is
     * the hot path in real use, gen() runs once per divisor up front. */
    for (int d = 0; d < NUM_DIVISORS; d++) {
        magics[d] = libdivide_u32_gen(divisors[d]);
    }

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
    volatile uint32_t mismatches = 0;
    for (int d = 0; d < NUM_DIVISORS; d++) {
        for (int i = 0; i < NUM_NUMERATORS; i++) {
            uint32_t expected = numerators[i] / divisors[d];
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
