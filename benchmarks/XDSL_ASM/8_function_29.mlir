.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t3, a1
    mv t5, a2
    mv t4, a3
    and t2, t3, t1
    rem t0, t5, t1
    xor t0, t0, t2
    xor t3, t3, t5
    czero.eqz t2, t2, t4
    czero.nez t3, t3, t4
    or t2, t2, t3
    rem t0, t0, t2
    srl t0, t0, t1
    mv a0, t0
    ret
