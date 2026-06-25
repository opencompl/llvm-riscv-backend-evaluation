.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t2, a1
    mv t3, a2
    remu t1, t0, t0
    slt t4, t1, t2
    xori t4, t4, 1
    remu t3, t3, t2
    rem t3, t1, t3
    czero.eqz t2, t0, t4
    czero.nez t3, t3, t4
    or t2, t2, t3
    div t1, t1, t2
    srl t0, t0, t1
    mv a0, t0
    ret
