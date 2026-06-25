.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t0, a1
    mv t1, a2
    divu t0, t2, t0
    or t2, t0, t2
    xor t2, t1, t2
    srl t3, t0, t1
    slt t3, t3, t2
    czero.eqz t0, t0, t3
    czero.nez t3, t2, t3
    or t0, t0, t3
    czero.eqz t0, t0, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    mv a0, t0
    ret
