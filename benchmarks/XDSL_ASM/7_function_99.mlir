.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t0, a1
    mv t2, a2
    div t1, t1, t0
    and t2, t2, t0
    div t2, t1, t2
    sext.w t1, t1
    czero.eqz t0, t0, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    mv a0, t0
    ret
