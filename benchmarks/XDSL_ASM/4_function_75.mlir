.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t0, a1
    mv t2, a2
    czero.eqz t1, t0, t3
    czero.nez t3, t0, t3
    or t1, t1, t3
    zext.w t2, t2
    xor t2, t2, t1
    sltiu t2, t2, 1
    czero.eqz t0, t0, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    mv a0, t0
    ret
