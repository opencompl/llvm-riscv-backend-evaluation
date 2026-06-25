.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t2, a1
    mv t1, a2
    xor t0, t0, t0
    and t3, t2, t2
    remu t0, t0, t3
    sra t1, t1, t2
    sra t0, t0, t1
    mv a0, t0
    ret
