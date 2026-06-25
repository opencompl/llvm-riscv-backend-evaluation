.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    xor t1, t0, t0
    div t0, t0, t1
    mv a0, t0
    ret
