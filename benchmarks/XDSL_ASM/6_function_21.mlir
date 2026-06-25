.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t2, a1
    mv t0, a2
    sext.w t0, t0
    czero.eqz t1, t2, t3
    czero.nez t3, t0, t3
    or t1, t1, t3
    div t0, t0, t0
    xor t1, t0, t1
    xor t0, t0, t2
    or t0, t0, t1
    mv a0, t0
    ret
