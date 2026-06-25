.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t2, a1
    mv t5, a2
    mv t3, a3
    divu t0, t1, t2
    divu t4, t0, t0
    divu t4, t4, t5
    or t1, t1, t4
    czero.eqz t0, t0, t3
    czero.nez t2, t2, t3
    or t0, t0, t2
    or t0, t0, t1
    mv a0, t0
    ret
