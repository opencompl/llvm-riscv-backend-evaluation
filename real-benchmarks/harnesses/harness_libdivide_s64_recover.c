#include <libdivide.h>
#include <stdint.h>
#include <stdio.h>

#include <gem5/m5ops.h>

#define NUM_DIVISORS 1024

/*
 * Kernel under test: libdivide_s64_recover as lowered by the pipeline
 * under evaluation. bench.py renames the asm entry symbol to
 * 'bench_kernel', so it cannot collide with libdivide.h's static-inline
 * reference implementation (which has a different signature anyway).
 */
extern void bench_kernel(const struct libdivide_s64_t *denom, int64_t *out);

/*
 * recover() branches on properties of the input struct (shift-path vs
 * mult-path, negative-divisor bit), so which path each call takes
 * depends on the original divisor. Keep this divisor set identical
 * across every variant you compare.
 */
static int64_t divisors[NUM_DIVISORS];
static struct libdivide_s64_t magics[NUM_DIVISORS];
static int64_t recovered[NUM_DIVISORS];

static void
init_divisors(void)
{
    /* Deterministic LCG -- same sequence every run. */
    uint64_t x = 1;
    for (int i = 0; i < NUM_DIVISORS; i++) {
        x = x * 6364136223846793005ULL + 1442695040888963407ULL;
        int64_t d = (int64_t)(x >> 1); /* avoid INT64_MIN edge case */
        if (d == 0) {
            d = 1; /* divisor must be non-zero */
        }
        divisors[i] = d;
    }

    /* Force in edge cases so both the shift path (power-of-two divisor)
     * and the mult path, plus both signs, are exercised every run. */
    divisors[0] = 1;
    divisors[1] = -1;
    divisors[2] = 64;   /* power of two -> shift path, positive */
    divisors[3] = -128; /* power of two -> shift path, negative */
    divisors[4] = 3;    /* odd -> mult path, positive */
    divisors[5] = -7;   /* odd -> mult path, negative */
}

int
main(void)
{
    init_divisors();

    /* Setup: generate the magic/shift struct for each divisor using the
     * reference header implementation. Not measured -- mirrors real
     * usage, where gen() runs once and recover() runs many times. */
    for (int i = 0; i < NUM_DIVISORS; i++) {
        magics[i] = libdivide_s64_gen(divisors[i]);
    }

    m5_reset_stats(0, 0);
    for (int i = 0; i < 1000; i++) {
        bench_kernel(&magics[i], &recovered[i]);
    }
    m5_dump_stats(0, 0);

    /* Correctness check + prevents dead-code elimination: recovered[i]
     * should exactly equal divisors[i] for every measured entry. */
    volatile int64_t mismatches = 0;
    for (int i = 0; i < 1000; i++) {
        if (recovered[i] != divisors[i]) {
            mismatches++;
        }
    }


    /* FNV-1a checksum of the outputs: bench.py compares this line
     * across pipelines to verify they all computed the same result. */
    uint64_t h = 1469598103934665603ULL;
    for (int i = 0; i < 1000; i++) {
        h ^= (uint64_t)recovered[i];
        h *= 1099511628211ULL;
    }
    printf("CHECKSUM: 0x%016llx\n", (unsigned long long)h);

    return (int)mismatches;
}
