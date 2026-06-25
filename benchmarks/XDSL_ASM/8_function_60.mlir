.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t1, a1
    mv t3, a2
    sext.w t0, t2
    czero.eqz t3, t3, t1
    czero.nez t4, t2, t1
    or t3, t3, t4
    rem t1, t1, t3
    xor t1, t1, t2
    div t0, t0, t1
    mv a0, t0
    ret
