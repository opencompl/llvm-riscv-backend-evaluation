.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t4, a1
    mv t2, a2
    div t1, t3, t3
    and t3, t3, t3
    czero.eqz t0, t1, t4
    czero.nez t3, t3, t4
    or t0, t0, t3
    remu t0, t0, t2
    or t0, t0, t1
    mv a0, t0
    ret
