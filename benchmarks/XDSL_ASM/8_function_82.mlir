.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t0, a1
    mv t3, a2
    remu t1, t1, t0
    czero.eqz t2, t0, t3
    czero.nez t3, t0, t3
    or t2, t2, t3
    slt t2, t2, t1
    or t0, t0, t0
    czero.eqz t0, t0, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    sext.w t0, t0
    mv a0, t0
    ret
