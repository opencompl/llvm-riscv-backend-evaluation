.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t3, a1
    mv t1, a2
    srl t0, t2, t2
    sra t0, t0, t1
    remu t0, t3, t0
    srl t1, t1, t3
    czero.eqz t1, t1, t2
    czero.nez t3, t2, t2
    or t1, t1, t3
    czero.eqz t0, t0, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    mv a0, t0
    ret
