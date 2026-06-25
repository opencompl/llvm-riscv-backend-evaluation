.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t1, a1
    mv t3, a2
    xor t0, t1, t2
    rem t2, t0, t2
    divu t1, t1, t2
    or t1, t1, t3
    xor t1, t1, t2
    remu t0, t0, t1
    remu t0, t0, t0
    mv a0, t0
    ret
