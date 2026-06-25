.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t2, a1
    mv t3, a2
    sext.w t2, t2
    and t1, t2, t1
    zext.w t1, t1
    czero.eqz t0, t2, t3
    czero.nez t2, t2, t3
    or t0, t0, t2
    or t0, t0, t1
    mv a0, t0
    ret
