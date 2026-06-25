.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t0, a1
    mv t3, a2
    sext.w t2, t2
    slt t2, t0, t2
    sra t1, t0, t0
    rem t1, t1, t3
    czero.eqz t0, t0, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    sra t0, t0, t0
    mv a0, t0
    ret
