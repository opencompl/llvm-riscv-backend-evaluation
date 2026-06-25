.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    sext.w t1, t1
    czero.eqz t0, t1, t1
    czero.nez t2, t1, t1
    or t0, t0, t2
    and t0, t0, t1
    mv a0, t0
    ret
