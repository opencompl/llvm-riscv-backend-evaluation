.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t0, a1
    mv t3, a2
    divu t1, t2, t0
    and t2, t1, t2
    remu t4, t2, t1
    xor t3, t3, t4
    sltiu t3, t3, 1
    czero.eqz t1, t1, t3
    czero.nez t2, t2, t3
    or t1, t1, t2
    or t0, t0, t1
    mv a0, t0
    ret
