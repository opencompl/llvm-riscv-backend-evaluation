.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t1, a1
    mv t0, a2
    zext.w t0, t0
    srl t1, t1, t0
    czero.eqz t0, t1, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    or t0, t0, t0
    mv a0, t0
    ret
