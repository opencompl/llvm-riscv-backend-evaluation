#include <stdint.h>
#include <stdio.h>

#include <gem5/m5ops.h>

/*
 * Harness for synthetic fuzzed kernels that read none of their argument
 * registers (they return a constant or compute only from internal values).
 * See harness_synth_1arg.c for the shared conventions (symbol renaming,
 * 64-bit long values, measured region, checksum).
 */

#ifndef ITERS
#define ITERS 10000
#endif

extern long bench_kernel(void);

int
main(void)
{
    uint64_t checksum = 0;

    m5_reset_stats(0, 0);
    for (long i = 0; i < ITERS; i++) {
        checksum += (uint64_t)bench_kernel();
    }
    m5_dump_stats(0, 0);

    printf("CHECKSUM: 0x%016llx\n", (unsigned long long)checksum);
    return 0;
}
