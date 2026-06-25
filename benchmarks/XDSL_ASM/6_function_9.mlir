.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t0, a1
    mv t4, a2
    mv t3, a3
    sext.w t3, t3
    czero.eqz t1, t3, t4
    czero.nez t3, t3, t4
    or t1, t1, t3
    czero.eqz t0, t0, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    zext.w t0, t0
    mv a0, t0
    ret
