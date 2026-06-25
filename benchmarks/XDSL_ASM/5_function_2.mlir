.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t2, a1
    mv t3, a2
    xor t3, t3, t2
    divu t1, t2, t3
    and t1, t1, t3
    sra t1, t1, t2
    remu t0, t0, t1
    mv a0, t0
    ret
