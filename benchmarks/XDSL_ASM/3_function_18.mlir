.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t1, a1
    srl t1, t1, t0
    div t0, t0, t1
    mv a0, t0
    ret
