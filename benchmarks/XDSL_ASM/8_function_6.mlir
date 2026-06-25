.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t1, a1
    mv t3, a2
    mv t4, a3
    zext.w t0, t0
    czero.eqz t2, t3, t4
    czero.nez t4, t0, t4
    or t2, t2, t4
    or t3, t2, t3
    rem t2, t3, t2
    xor t2, t2, t3
    divu t2, t2, t3
    rem t1, t1, t2
    sra t0, t0, t1
    mv a0, t0
    ret
