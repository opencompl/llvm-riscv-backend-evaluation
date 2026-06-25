.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t3, a1
    mv t4, a2
    sext.w t1, t2
    div t0, t2, t1
    divu t2, t2, t4
    srl t2, t3, t2
    remu t1, t1, t3
    xor t1, t1, t2
    rem t0, t0, t1
    mv a0, t0
    ret
