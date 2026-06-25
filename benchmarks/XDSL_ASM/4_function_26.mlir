.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t2, a1
    mv t0, a2
    czero.eqz t1, t2, t3
    czero.nez t3, t0, t3
    or t1, t1, t3
    xor t3, t0, t1
    sltiu t3, t3, 1
    czero.eqz t0, t0, t3
    czero.nez t2, t2, t3
    or t0, t0, t2
    xor t0, t0, t1
    mv a0, t0
    ret
