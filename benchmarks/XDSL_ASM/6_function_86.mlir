.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t1, a1
    mv t3, a2
    or t0, t2, t2
    or t1, t1, t0
    and t1, t1, t0
    czero.eqz t0, t1, t3
    czero.nez t3, t1, t3
    or t0, t0, t3
    xor t0, t0, t2
    or t0, t0, t1
    mv a0, t0
    ret
