.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t2, a1
    mv t3, a2
    remu t1, t0, t2
    sra t0, t0, t3
    remu t0, t0, t2
    div t2, t0, t2
    srl t0, t0, t2
    xor t0, t0, t1
    mv a0, t0
    ret
