.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t4, a1
    mv t0, a2
    mv t3, a3
    div t2, t1, t1
    sra t1, t2, t1
    xor t4, t4, t1
    and t0, t0, t4
    czero.eqz t1, t1, t3
    czero.nez t3, t0, t3
    or t1, t1, t3
    divu t1, t1, t2
    divu t0, t0, t1
    mv a0, t0
    ret
