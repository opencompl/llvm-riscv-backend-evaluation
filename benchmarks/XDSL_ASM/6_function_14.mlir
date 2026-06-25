.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t0, a1
    mv t4, a2
    rem t1, t0, t0
    czero.eqz t2, t1, t4
    czero.nez t4, t0, t4
    or t2, t2, t4
    czero.eqz t0, t0, t3
    czero.nez t2, t2, t3
    or t0, t0, t2
    rem t0, t0, t1
    sext.w t0, t0
    mv a0, t0
    ret
