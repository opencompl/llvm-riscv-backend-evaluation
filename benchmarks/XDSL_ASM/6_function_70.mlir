.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t3, a1
    mv t2, a2
    remu t1, t1, t1
    remu t1, t1, t1
    czero.eqz t0, t2, t3
    czero.nez t3, t2, t3
    or t0, t0, t3
    sra t1, t1, t0
    remu t0, t0, t2
    and t0, t0, t1
    mv a0, t0
    ret
