.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t2, a1
    mv t1, a2
    zext.w t4, t3
    sltu t4, t4, t4
    xori t4, t4, 1
    czero.eqz t0, t3, t4
    czero.nez t4, t3, t4
    or t0, t0, t4
    or t0, t0, t3
    sra t1, t1, t1
    or t1, t1, t2
    sra t0, t0, t1
    mv a0, t0
    ret
