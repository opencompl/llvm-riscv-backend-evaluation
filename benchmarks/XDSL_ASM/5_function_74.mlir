.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t3, a1
    mv t2, a2
    sext.w t2, t2
    czero.eqz t0, t1, t3
    czero.nez t2, t2, t3
    or t0, t0, t2
    and t0, t0, t1
    srl t0, t0, t1
    mv a0, t0
    ret
