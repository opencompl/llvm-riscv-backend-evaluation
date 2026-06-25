.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t5, a1
    mv t3, a2
    or t0, t2, t2
    divu t1, t2, t0
    slt t4, t0, t1
    sra t0, t0, t5
    czero.eqz t0, t0, t4
    czero.nez t3, t3, t4
    or t0, t0, t3
    and t0, t0, t2
    sra t0, t0, t1
    mv a0, t0
    ret
