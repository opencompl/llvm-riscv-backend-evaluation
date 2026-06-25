.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t3, a1
    mv t2, a2
    mv t4, a3
    zext.w t0, t0
    or t1, t2, t3
    czero.eqz t3, t3, t4
    czero.nez t5, t2, t4
    or t3, t3, t5
    czero.eqz t2, t2, t4
    czero.nez t4, t3, t4
    or t2, t2, t4
    div t3, t3, t0
    srl t2, t2, t3
    remu t1, t1, t2
    divu t0, t0, t1
    mv a0, t0
    ret
