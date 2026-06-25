.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t1, a1
    mv t0, a2
    czero.eqz t2, t1, t3
    czero.nez t3, t0, t3
    or t2, t2, t3
    rem t2, t2, t1
    sra t0, t0, t1
    slt t2, t2, t0
    czero.eqz t0, t0, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    mv a0, t0
    ret
