.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t3, a1
    mv t1, a2
    xor t5, t3, t2
    sltiu t5, t5, 1
    divu t4, t1, t3
    czero.eqz t0, t1, t5
    czero.nez t4, t4, t5
    or t0, t0, t4
    or t1, t1, t2
    sltu t3, t3, t1
    czero.eqz t1, t0, t3
    czero.nez t2, t2, t3
    or t1, t1, t2
    sra t0, t0, t1
    mv a0, t0
    ret
