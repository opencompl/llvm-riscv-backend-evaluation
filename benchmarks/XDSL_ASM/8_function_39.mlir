.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t3, a1
    mv t0, a2
    or t1, t2, t2
    sra t1, t2, t1
    czero.eqz t0, t0, t3
    czero.nez t3, t2, t3
    or t0, t0, t3
    and t2, t2, t0
    or t0, t0, t2
    divu t0, t0, t0
    or t0, t0, t1
    mv a0, t0
    ret
