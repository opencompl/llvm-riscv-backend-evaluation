.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t0, a1
    mv t2, a2
    or t0, t0, t3
    divu t1, t3, t3
    rem t1, t1, t3
    sra t2, t2, t2
    rem t1, t1, t2
    srl t0, t0, t1
    mv a0, t0
    ret
