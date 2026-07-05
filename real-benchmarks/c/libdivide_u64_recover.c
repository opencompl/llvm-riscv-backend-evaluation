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


__attribute__((always_inline)) static uint32_t libdivide_mullhi_u32(uint32_t x, uint32_t y) {
    uint64_t xl = x, yl = y;
    uint64_t rl = xl * yl;
    return (uint32_t)(rl >> 32);
}

__attribute__((always_inline)) static uint64_t libdivide_mullhi_u64(uint64_t x, uint64_t y) {
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

__attribute__((always_inline)) static int64_t libdivide_mullhi_s64(int64_t x, int64_t y) {
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

__attribute__((always_inline)) static int32_t libdivide_count_leading_zeros32(uint32_t val) {
    if (val == 0) return 32;
    int32_t result = 8;
    uint32_t hi = 0xFFU << 24;
    while ((val & hi) == 0) {
        hi >>= 8;
        result += 8;
    }
    while (val & hi) {
        result -= 1;
        hi <<= 1;
    }
    return result;
}

__attribute__((always_inline)) static int32_t libdivide_count_leading_zeros64(uint64_t val) {
    uint32_t hi = val >> 32;
    uint32_t lo = val & 0xFFFFFFFF;
    if (hi != 0) return libdivide_count_leading_zeros32(hi);
    return 32 + libdivide_count_leading_zeros32(lo);
}

// libdivide_128_div_64_to_64: divides a 128-bit uint {numhi, numlo} by a 64-bit uint {den}. The
// result must fit in 64 bits. Returns the quotient directly and the remainder in *r
__attribute__((always_inline)) static uint64_t libdivide_128_div_64_to_64(
    uint64_t numhi, uint64_t numlo, uint64_t den, uint64_t *r) {
    // N.B. resist the temptation to use __uint128_t here.
    // In LLVM compiler-rt, it performs a 128/128 -> 128 division which is many times slower than
    // necessary. In gcc it's better but still slower than the divlu implementation, perhaps because
    // it's not LIBDIVIDE_INLINEd.
    const uint64_t b = ((uint64_t)1 << 32);

    uint32_t q1;
    uint32_t q0;
    uint64_t q;
    int shift;

    uint64_t den10 = den;
    uint64_t num10 = numlo;

    uint32_t den1;
    uint32_t den0;
    uint32_t num1;
    uint32_t num0;

    uint64_t rem;

    uint64_t qhat;
    uint64_t rhat;

    uint64_t c1;
    uint64_t c2;

    // Check for overflow and divide by 0.
    if (numhi >= den) {
        if (r) *r = ~0ull;
        return ~0ull;
    }

    shift = libdivide_count_leading_zeros64(den);
    den <<= shift;
    numhi <<= shift;
    numhi |= (numlo >> (-shift & 63)) & (uint64_t)(-(int64_t)shift >> 63);
    numlo <<= shift;

    num1 = (uint32_t)(numlo >> 32);
    num0 = (uint32_t)(numlo & 0xFFFFFFFFu);
    den1 = (uint32_t)(den >> 32);
    den0 = (uint32_t)(den & 0xFFFFFFFFu);

    qhat = numhi / den1;
    rhat = numhi % den1;
    c1 = qhat * den0;
    c2 = rhat * b + num1;
    if (c1 > c2) qhat -= (c1 - c2 > den) ? 2 : 1;
    q1 = (uint32_t)qhat;

    rem = numhi * b + num1 - q1 * den;

    qhat = rem / den1;
    rhat = rem % den1;
    c1 = qhat * den0;
    c2 = rhat * b + num0;
    if (c1 > c2) qhat -= (c1 - c2 > den) ? 2 : 1;
    q0 = (uint32_t)qhat;

    q = ((uint64_t)q1 << 32) | q0;

    if (r) *r = num10 - q * den10;
    return q;
}

// Bitshift a u128 in place, left (signed_shift > 0) or right (signed_shift < 0)
__attribute__((always_inline)) static void libdivide_u128_shift(
    uint64_t *u1, uint64_t *u0, int32_t signed_shift) {
    if (signed_shift > 0) {
        uint32_t shift = signed_shift;
        *u1 <<= shift;
        *u1 |= *u0 >> (64 - shift);
        *u0 <<= shift;
    } else if (signed_shift < 0) {
        uint32_t shift = -signed_shift;
        *u0 >>= shift;
        *u0 |= *u1 << (64 - shift);
        *u1 >>= shift;
    }
}

// Computes a 128 / 128 -> 64 bit division, with a 128 bit remainder.
__attribute__((always_inline)) static uint64_t libdivide_128_div_128_to_64(
    uint64_t u_hi, uint64_t u_lo, uint64_t v_hi, uint64_t v_lo, uint64_t *r_hi, uint64_t *r_lo) {
    // Adapted from "Unsigned Doubleword Division" in Hacker's Delight
    typedef struct {
        uint64_t hi;
        uint64_t lo;
    } u128_t;
    u128_t u = {u_hi, u_lo};
    u128_t v = {v_hi, v_lo};

    if (v.hi == 0) {
        *r_hi = 0;
        return libdivide_128_div_64_to_64(u.hi, u.lo, v.lo, r_lo);
    }
    uint32_t n = libdivide_count_leading_zeros64(v.hi);

    u128_t v1t = v;
    libdivide_u128_shift(&v1t.hi, &v1t.lo, n);
    uint64_t v1 = v1t.hi;

    u128_t u1 = u;
    libdivide_u128_shift(&u1.hi, &u1.lo, -1);

    uint64_t rem_ignored;
    uint64_t q1 = libdivide_128_div_64_to_64(u1.hi, u1.lo, v1, &rem_ignored);

    u128_t q0 = {0, q1};
    libdivide_u128_shift(&q0.hi, &q0.lo, n);
    libdivide_u128_shift(&q0.hi, &q0.lo, -63);

    if (q0.hi != 0 || q0.lo != 0) {
        q0.hi -= (q0.lo == 0);
        q0.lo -= 1;
    }

    u128_t q0v = {0, 0};
    q0v.hi = q0.hi * v.lo + q0.lo * v.hi + libdivide_mullhi_u64(q0.lo, v.lo);
    q0v.lo = q0.lo * v.lo;

    u128_t u_q0v = u;
    u_q0v.hi -= q0v.hi + (u.lo < q0v.lo);
    u_q0v.lo -= q0v.lo;

    if ((u_q0v.hi > v.hi) || (u_q0v.hi == v.hi && u_q0v.lo >= v.lo)) {
        q0.lo += 1;
        q0.hi += (q0.lo == 0);
        u_q0v.hi -= v.hi + (u_q0v.lo < v.lo);
        u_q0v.lo -= v.lo;
    }

    *r_hi = u_q0v.hi;
    *r_lo = u_q0v.lo;

    return q0.lo;
}


////////// UINT64

// Recovers the original u64 divisor from a generated (non-branchfree) struct
// and writes it to *out.
__attribute__((always_inline)) void libdivide_u64_recover(
    const struct libdivide_u64_t *denom, uint64_t *out) {
    uint8_t more = denom->more;
    uint8_t shift = more & LIBDIVIDE_64_SHIFT_MASK;

    if (!denom->magic) {
        // Shift path: d was a power of 2, stored directly as the shift.
        *out = (uint64_t)1 << shift;
    } else if (!(more & LIBDIVIDE_ADD_MARKER)) {
        // We compute q = n/d = n*m / 2^(64 + shift)
        // Therefore we have d = 2^(64 + shift) / m
        // We need to ceil it.
        // We know d is not a power of 2, so m is not a power of 2,
        // so we can just add 1 to the floor
        uint64_t hi_dividend = (uint64_t)1 << shift;
        uint64_t rem_ignored;
        uint64_t q = libdivide_128_div_64_to_64(hi_dividend, 0, denom->magic, &rem_ignored);
        *out = 1 + q;
    } else {
        // Here we wish to compute d = 2^(64+shift+1)/(m+2^64).
        // Notice (m + 2^64) is a 65 bit number. This gets hairy.
        uint64_t half_n_hi = (uint64_t)1 << shift, half_n_lo = 0;
        const uint64_t d_hi = 1, d_lo = denom->magic;
        uint64_t r_hi, r_lo;
        uint64_t half_q =
            libdivide_128_div_128_to_64(half_n_hi, half_n_lo, d_hi, d_lo, &r_hi, &r_lo);
        uint64_t dr_lo = r_lo + r_lo;
        uint64_t dr_hi = r_hi + r_hi + (dr_lo < r_lo);
        int dr_exceeds_d = (dr_hi > d_hi) || (dr_hi == d_hi && dr_lo >= d_lo);
        uint64_t full_q = half_q + half_q + (dr_exceeds_d ? 1 : 0);
        *out = 1 + full_q;
    }
}
