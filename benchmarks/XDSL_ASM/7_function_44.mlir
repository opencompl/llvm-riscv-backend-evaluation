.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t1, a1
    mv t3, a2
    remu t0, t2, t2
    remu t1, t0, t1
    czero.eqz t2, t2, t3
    czero.nez t0, t0, t3
    or t2, t2, t0
    xor t0, t1, t2
    div t0, t0, t2
    xor t0, t0, t1
    mv a0, t0
    ret
