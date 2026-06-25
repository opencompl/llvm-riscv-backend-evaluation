.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t3, a1
    mv t1, a2
    mv t0, a3
    sra t4, t2, t3
    remu t3, t4, t3
    sltu t3, t2, t3
    div t2, t2, t4
    czero.eqz t1, t1, t3
    czero.nez t2, t2, t3
    or t1, t1, t2
    zext.w t0, t0
    and t0, t0, t1
    mv a0, t0
    ret
