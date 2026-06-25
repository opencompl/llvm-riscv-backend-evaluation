.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t2, a1
    mv t3, a2
    divu t0, t0, t2
    rem t4, t0, t2
    or t1, t0, t0
    xor t1, t1, t4
    divu t2, t2, t3
    sra t1, t1, t2
    divu t0, t0, t1
    mv a0, t0
    ret
