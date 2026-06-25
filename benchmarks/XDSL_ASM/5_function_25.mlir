.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t4, a1
    mv t0, a2
    div t1, t3, t3
    czero.eqz t2, t3, t4
    czero.nez t3, t3, t4
    or t2, t2, t3
    remu t2, t1, t2
    and t0, t0, t2
    or t0, t0, t1
    mv a0, t0
    ret
