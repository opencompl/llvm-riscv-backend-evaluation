.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t3, a1
    mv t0, a2
    sext.w t3, t3
    sltu t2, t3, t1
    xori t2, t2, 1
    rem t3, t0, t3
    div t0, t0, t3
    srl t1, t1, t0
    czero.eqz t0, t0, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    mv a0, t0
    ret
