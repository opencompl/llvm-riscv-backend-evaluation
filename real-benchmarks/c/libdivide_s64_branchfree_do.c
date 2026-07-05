// libdivide.h - Optimized integer division
// https://libdivide.com
//
// Copyright (C) 2010 - 2022 ridiculous_fish, <libdivide@ridiculousfish.com>
// Copyright (C) 2016 - 2026 Kim Walisch, <kim.walisch@gmail.com>
//
// libdivide is dual-licensed under the Boost or zlib licenses.
// You may use libdivide under the terms of either of these.
// See LICENSE.txt for more details.


#include <stdint.h>

struct libdivide_u64_t {
    uint64_t magic;
    uint8_t more;
};

struct libdivide_s64_t {
    int64_t magic;
    uint8_t more;
};

enum {
    LIBDIVIDE_16_SHIFT_MASK = 0x1F,
    LIBDIVIDE_32_SHIFT_MASK = 0x1F,
    LIBDIVIDE_64_SHIFT_MASK = 0x3F,
    LIBDIVIDE_ADD_MARKER = 0x40,
    LIBDIVIDE_NEGATIVE_DIVISOR = 0x80
};

struct libdivide_u64_branchfree_t {
    uint64_t magic;
    uint8_t more;
};

struct libdivide_s64_branchfree_t {
    int64_t magic;
    uint8_t more;
};

// Explanation of the "more" field:
//
// * Bits 0-5 is the shift value (for shift path or mult path).
// * Bit 6 is the add indicator for mult path.
// * Bit 7 is set if the divisor is negative. We use bit 7 as the negative
//   divisor indicator so that we can efficiently use sign extension to
//   create a bitmask with all bits set to 1 (if the divisor is negative)
//   or 0 (if the divisor is positive).
//
// u64: [0-5] shift value
//      [6] add indicator
//      magic number of 0 indicates shift path
//
// s64: [0-5] shift value
//      [6] add indicator
//      [7] indicates negative divisor
//      magic number of 0 indicates shift path
//
// In s32 and s64 branchfree modes, the magic number is negated according to
// whether the divisor is negated. In branchfree strategy, it is not negated.


__attribute__((always_inline)) uint32_t libdivide_mullhi_u32(uint32_t x, uint32_t y) {
    uint64_t xl = x, yl = y;
    uint64_t rl = xl * yl;
    return (uint32_t)(rl >> 32);
}

__attribute__((always_inline)) uint64_t libdivide_mullhi_u64(uint64_t x, uint64_t y) {
    // full 128 bits are x0 * y0 + (x0 * y1 << 32) + (x1 * y0 << 32) + (x1 * y1 << 64)
    uint32_t mask = 0xFFFFFFFF;
    uint32_t x0 = (uint32_t)(x & mask);
    uint32_t x1 = (uint32_t)(x >> 32);
    uint32_t y0 = (uint32_t)(y & mask);
    uint32_t y1 = (uint32_t)(y >> 32);
    uint32_t x0y0_hi = libdivide_mullhi_u32(x0, y0);
    uint64_t x0y1 = x0 * (uint64_t)y1;
    uint64_t x1y0 = x1 * (uint64_t)y0;
    uint64_t x1y1 = x1 * (uint64_t)y1;
    uint64_t temp = x1y0 + x0y0_hi;
    uint64_t temp_lo = temp & mask;
    uint64_t temp_hi = temp >> 32;

    return x1y1 + temp_hi + ((temp_lo + x0y1) >> 32);
}

__attribute__((always_inline)) int64_t libdivide_mullhi_s64(int64_t x, int64_t y) {
    // full 128 bits are x0 * y0 + (x0 * y1 << 32) + (x1 * y0 << 32) + (x1 * y1 << 64)
    uint32_t mask = 0xFFFFFFFF;
    uint32_t x0 = (uint32_t)(x & mask);
    uint32_t y0 = (uint32_t)(y & mask);
    int32_t x1 = (int32_t)(x >> 32);
    int32_t y1 = (int32_t)(y >> 32);
    uint32_t x0y0_hi = libdivide_mullhi_u32(x0, y0);
    int64_t t = x1 * (int64_t)y0 + x0y0_hi;
    int64_t w1 = x0 * (int64_t)y1 + (t & mask);

    return x1 * (int64_t)y1 + (t >> 32) + (w1 >> 32);
}

// Applies a generated branchfree s64 divider to numer and writes the
// quotient to *out.
__attribute__((always_inline)) void libdivide_s64_branchfree_do(
    int64_t numer, const struct libdivide_s64_branchfree_t *denom, int64_t *out) {
    uint8_t more = denom->more;
    uint8_t shift = more & LIBDIVIDE_64_SHIFT_MASK;
    int64_t sign = (int8_t)more >> 7;
    int64_t magic = denom->magic;
    int64_t q = libdivide_mullhi_s64(numer, magic);
    q += numer;

    uint64_t is_power_of_2 = (magic == 0);
    uint64_t q_sign = (uint64_t)(q >> 63);
    q += q_sign & (((uint64_t)1 << shift) - is_power_of_2);

    q >>= shift;
    q = (q ^ sign) - sign;

    *out = q;
}