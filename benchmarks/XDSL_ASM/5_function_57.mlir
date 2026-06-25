.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t1, a1
    mv t0, a2
    srl t3, t1, t2
    and t3, t3, t2
    sra t2, t2, t3
    czero.eqz t0, t0, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    mv a0, t0
    ret
