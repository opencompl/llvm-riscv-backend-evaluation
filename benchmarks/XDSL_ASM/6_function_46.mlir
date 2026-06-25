.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t1, a1
    slt t2, t3, t3
    xori t2, t2, 1
    xor t3, t3, t3
    remu t0, t3, t3
    and t1, t1, t3
    czero.eqz t0, t0, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    mv a0, t0
    ret
