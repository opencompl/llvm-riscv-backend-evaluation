.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t1, a1
    mv t2, a2
    sra t2, t1, t2
    or t0, t2, t0
    sra t1, t1, t2
    div t0, t0, t1
    mv a0, t0
    ret
