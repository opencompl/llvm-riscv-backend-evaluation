.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t1, a1
    mv t2, a2
    remu t0, t0, t1
    div t1, t2, t2
    czero.eqz t2, t2, t1
    czero.nez t3, t1, t1
    or t2, t2, t3
    div t0, t0, t2
    srl t0, t0, t1
    mv a0, t0
    ret
