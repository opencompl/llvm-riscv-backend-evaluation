.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t0, a1
    mv t1, a2
    sltu t2, t3, t3
    xori t2, t2, 1
    remu t0, t0, t3
    or t3, t0, t0
    remu t1, t1, t3
    czero.eqz t0, t0, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    mv a0, t0
    ret
