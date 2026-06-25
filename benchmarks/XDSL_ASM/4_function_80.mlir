.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    sra t1, t0, t0
    remu t0, t0, t1
    and t0, t0, t1
    mv a0, t0
    ret
