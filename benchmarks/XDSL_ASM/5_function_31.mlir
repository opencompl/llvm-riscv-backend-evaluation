.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t0, a1
    mv t3, a2
    mv t2, a3
    srl t3, t0, t3
    slt t3, t1, t3
    xori t3, t3, 1
    zext.w t2, t2
    czero.eqz t1, t1, t3
    czero.nez t2, t2, t3
    or t1, t1, t2
    xor t0, t0, t1
    mv a0, t0
    ret
