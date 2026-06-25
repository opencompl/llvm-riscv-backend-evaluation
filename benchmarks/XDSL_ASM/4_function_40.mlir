.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t2, a1
    mv t1, a2
    czero.eqz t1, t1, t2
    czero.nez t2, t0, t2
    or t1, t1, t2
    divu t0, t0, t1
    sext.w t0, t0
    mv a0, t0
    ret
