.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t0, a1
    mv t2, a2
    srl t1, t1, t0
    xor t0, t2, t1
    sra t0, t1, t0
    czero.eqz t1, t1, t0
    czero.nez t2, t2, t0
    or t1, t1, t2
    remu t0, t0, t1
    mv a0, t0
    ret
