.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t5, a1
    mv t4, a2
    zext.w t1, t0
    xor t2, t1, t1
    czero.eqz t3, t2, t5
    czero.nez t4, t4, t5
    or t3, t3, t4
    slt t2, t2, t3
    czero.eqz t0, t0, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    mv a0, t0
    ret
