.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t4, a1
    mv t1, a2
    mv t3, a3
    czero.eqz t2, t4, t0
    czero.nez t4, t4, t0
    or t2, t2, t4
    sext.w t3, t3
    xor t3, t3, t0
    sra t1, t1, t3
    and t1, t1, t2
    and t0, t0, t1
    mv a0, t0
    ret
