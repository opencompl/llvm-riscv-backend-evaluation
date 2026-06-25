.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t1, a1
    mv t0, a2
    rem t0, t1, t0
    sext.w t0, t0
    divu t1, t0, t1
    czero.eqz t0, t0, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    sext.w t0, t0
    mv a0, t0
    ret
