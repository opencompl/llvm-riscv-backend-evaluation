.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t0, a1
    sra t2, t1, t1
    sra t3, t2, t1
    sra t3, t1, t3
    div t1, t1, t3
    xor t0, t0, t2
    xor t0, t0, t1
    mv a0, t0
    ret
