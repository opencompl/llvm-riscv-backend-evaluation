.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t3, a1
    mv t1, a2
    or t3, t3, t2
    slt t3, t3, t2
    czero.eqz t0, t1, t3
    czero.nez t2, t2, t3
    or t0, t0, t2
    div t0, t0, t1
    mv a0, t0
    ret
