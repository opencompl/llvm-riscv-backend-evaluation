.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t3, a1
    mv t5, a2
    mv t1, a3
    sltu t2, t3, t0
    xori t2, t2, 1
    or t4, t3, t0
    divu t3, t3, t5
    xor t3, t3, t4
    xor t0, t3, t0
    and t0, t0, t3
    zext.w t1, t1
    czero.eqz t0, t0, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    mv a0, t0
    ret
