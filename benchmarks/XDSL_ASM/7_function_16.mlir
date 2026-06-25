.text
.globl func0
.p2align 2
func0:
    mv t4, a0
    mv t3, a1
    mv t2, a2
    mv t1, a3
    czero.eqz t0, t3, t4
    czero.nez t3, t3, t4
    or t0, t0, t3
    div t0, t0, t2
    zext.w t1, t1
    sra t0, t0, t1
    sext.w t0, t0
    mv a0, t0
    ret
