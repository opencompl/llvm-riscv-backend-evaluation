.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t3, a1
    mv t2, a2
    and t0, t3, t1
    divu t0, t0, t3
    sltu t2, t2, t0
    xori t2, t2, 1
    czero.eqz t0, t0, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    sext.w t0, t0
    mv a0, t0
    ret
