.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t0, a1
    mv t2, a2
    zext.w t1, t2
    xor t2, t2, t1
    czero.eqz t0, t0, t3
    czero.nez t2, t2, t3
    or t0, t0, t2
    srl t0, t0, t1
    sext.w t0, t0
    mv a0, t0
    ret
