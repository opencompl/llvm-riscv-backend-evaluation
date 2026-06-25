.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t1, a1
    mv t4, a2
    slt t2, t3, t3
    xori t2, t2, 1
    sra t0, t3, t3
    remu t3, t3, t4
    sext.w t3, t3
    sra t1, t1, t3
    czero.eqz t0, t0, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    mv a0, t0
    ret
