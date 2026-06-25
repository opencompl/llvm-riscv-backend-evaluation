.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t3, a1
    mv t1, a2
    mv t2, a3
    xor t1, t1, t1
    zext.w t2, t2
    czero.eqz t1, t1, t3
    czero.nez t2, t2, t3
    or t1, t1, t2
    sra t0, t0, t1
    mv a0, t0
    ret
