.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t2, a1
    czero.eqz t1, t2, t0
    czero.nez t0, t2, t0
    or t1, t1, t0
    srl t0, t2, t1
    div t0, t0, t2
    and t0, t0, t1
    mv a0, t0
    ret
