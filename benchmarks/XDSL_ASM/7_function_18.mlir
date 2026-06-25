.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t0, a1
    rem t3, t1, t1
    divu t2, t3, t3
    div t2, t1, t2
    or t2, t2, t3
    sra t1, t1, t2
    remu t0, t0, t2
    and t0, t0, t1
    mv a0, t0
    ret
