.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t0, a1
    div t2, t1, t1
    and t3, t0, t0
    sra t2, t2, t3
    remu t1, t1, t2
    and t0, t0, t1
    mv a0, t0
    ret
