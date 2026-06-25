.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t0, a1
    mv t3, a2
    mv t4, a3
    czero.eqz t2, t1, t3
    czero.nez t5, t1, t3
    or t2, t2, t5
    sext.w t4, t4
    divu t2, t2, t4
    and t2, t2, t0
    czero.eqz t0, t2, t3
    czero.nez t3, t1, t3
    or t0, t0, t3
    and t0, t0, t2
    and t0, t0, t1
    mv a0, t0
    ret
