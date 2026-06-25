.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t1, a1
    and t0, t1, t1
    divu t2, t1, t0
    or t2, t2, t0
    czero.eqz t0, t1, t3
    czero.nez t2, t2, t3
    or t0, t0, t2
    sext.w t0, t0
    and t1, t1, t0
    remu t0, t0, t1
    mv a0, t0
    ret
