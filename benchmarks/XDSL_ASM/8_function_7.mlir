.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t3, a1
    mv t0, a2
    mv t4, a3
    sext.w t1, t1
    and t2, t1, t3
    remu t1, t1, t2
    czero.eqz t2, t2, t4
    czero.nez t4, t1, t4
    or t2, t2, t4
    and t2, t2, t3
    and t2, t2, t1
    remu t0, t0, t2
    or t0, t0, t1
    mv a0, t0
    ret
