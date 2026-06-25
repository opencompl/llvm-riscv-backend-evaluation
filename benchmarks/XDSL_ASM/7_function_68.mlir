.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t0, a1
    mv t1, a2
    slt t4, t3, t3
    czero.eqz t2, t0, t4
    czero.nez t4, t3, t4
    or t2, t2, t4
    rem t2, t2, t3
    and t2, t2, t2
    xor t1, t1, t0
    czero.eqz t0, t2, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    mv a0, t0
    ret
