.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t3, a1
    mv t1, a2
    czero.eqz t2, t0, t3
    czero.nez t3, t1, t3
    or t2, t2, t3
    divu t0, t0, t2
    remu t1, t1, t1
    rem t0, t0, t1
    zext.w t0, t0
    mv a0, t0
    ret
