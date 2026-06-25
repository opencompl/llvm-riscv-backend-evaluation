.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t0, a1
    remu t1, t0, t0
    sra t1, t0, t1
    srl t1, t1, t0
    czero.eqz t0, t1, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    mv a0, t0
    ret
