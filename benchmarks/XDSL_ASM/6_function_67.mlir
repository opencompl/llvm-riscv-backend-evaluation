.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t1, a1
    mv t3, a2
    xor t2, t1, t1
    srl t2, t1, t2
    and t2, t2, t0
    xor t2, t2, t3
    rem t1, t1, t2
    sra t0, t0, t1
    mv a0, t0
    ret
