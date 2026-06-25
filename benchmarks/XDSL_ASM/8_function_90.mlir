.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t0, a1
    mv t1, a2
    and t2, t3, t3
    sext.w t2, t2
    xor t2, t2, t3
    sltiu t2, t2, 1
    czero.eqz t0, t0, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    zext.w t0, t0
    mv a0, t0
    ret
