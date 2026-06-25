.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t1, a1
    mv t2, a2
    remu t3, t2, t0
    sltu t3, t3, t1
    remu t1, t2, t2
    czero.eqz t1, t1, t3
    czero.nez t2, t2, t3
    or t1, t1, t2
    divu t0, t0, t1
    mv a0, t0
    ret
