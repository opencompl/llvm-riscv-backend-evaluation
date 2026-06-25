.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t3, a1
    mv t1, a2
    czero.eqz t0, t2, t3
    czero.nez t4, t2, t3
    or t0, t0, t4
    rem t0, t2, t0
    czero.eqz t1, t1, t3
    czero.nez t2, t2, t3
    or t1, t1, t2
    div t1, t0, t1
    remu t1, t1, t0
    or t0, t0, t1
    mv a0, t0
    ret
