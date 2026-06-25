.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t0, a1
    mv t3, a2
    srl t0, t2, t0
    czero.eqz t1, t0, t3
    czero.nez t3, t2, t3
    or t1, t1, t3
    or t1, t1, t2
    rem t0, t0, t1
    mv a0, t0
    ret
