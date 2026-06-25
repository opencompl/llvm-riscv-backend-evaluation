.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t2, a1
    mv t0, a2
    slt t2, t3, t2
    xori t2, t2, 1
    czero.eqz t1, t0, t2
    czero.nez t4, t3, t2
    or t1, t1, t4
    sra t0, t0, t1
    and t0, t0, t3
    xor t3, t0, t1
    remu t1, t1, t3
    czero.eqz t0, t0, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    mv a0, t0
    ret
