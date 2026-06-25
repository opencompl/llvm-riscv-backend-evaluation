.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t1, a1
    mv t2, a2
    sext.w t0, t0
    divu t2, t1, t2
    sltu t3, t2, t1
    xori t3, t3, 1
    czero.eqz t1, t1, t3
    czero.nez t2, t2, t3
    or t1, t1, t2
    and t0, t1, t0
    xor t1, t0, t1
    divu t0, t0, t1
    mv a0, t0
    ret
