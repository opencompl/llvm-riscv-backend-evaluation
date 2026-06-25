.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t4, a1
    mv t1, a2
    mv t2, a3
    div t0, t0, t4
    slt t4, t4, t0
    sra t3, t1, t0
    sext.w t2, t2
    rem t3, t3, t2
    czero.eqz t0, t0, t4
    czero.nez t3, t3, t4
    or t0, t0, t3
    rem t1, t1, t2
    sra t0, t0, t1
    mv a0, t0
    ret
