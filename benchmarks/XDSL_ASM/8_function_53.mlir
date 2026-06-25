.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t0, a1
    and t2, t3, t3
    czero.eqz t1, t2, t3
    czero.nez t2, t2, t3
    or t1, t1, t2
    srl t1, t1, t0
    or t0, t0, t1
    sext.w t0, t0
    mv a0, t0
    ret
