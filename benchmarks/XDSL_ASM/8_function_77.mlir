.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t3, a1
    mv t4, a2
    sext.w t1, t2
    xor t1, t3, t1
    czero.eqz t0, t1, t4
    czero.nez t4, t2, t4
    or t0, t0, t4
    div t3, t3, t2
    rem t0, t0, t3
    or t0, t0, t2
    xor t0, t0, t1
    mv a0, t0
    ret
