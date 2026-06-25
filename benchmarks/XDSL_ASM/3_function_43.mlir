.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t0, a1
    mv t2, a2
    div t0, t0, t2
    xor t0, t0, t1
    and t0, t0, t0
    mv a0, t0
    ret
