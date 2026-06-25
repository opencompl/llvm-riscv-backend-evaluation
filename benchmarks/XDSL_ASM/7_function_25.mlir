.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t3, a1
    mv t2, a2
    mv t0, a3
    divu t1, t1, t3
    czero.eqz t2, t2, t1
    czero.nez t3, t1, t1
    or t2, t2, t3
    zext.w t0, t0
    remu t1, t2, t1
    czero.eqz t0, t0, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    mv a0, t0
    ret
