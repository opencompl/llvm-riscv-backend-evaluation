.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t2, a1
    mv t3, a2
    xor t1, t3, t2
    div t3, t2, t3
    div t2, t2, t3
    divu t1, t1, t2
    srl t0, t0, t1
    mv a0, t0
    ret
