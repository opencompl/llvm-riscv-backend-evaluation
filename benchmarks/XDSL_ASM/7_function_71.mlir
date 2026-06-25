.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t1, a1
    mv t2, a2
    remu t3, t0, t0
    rem t4, t1, t2
    divu t0, t0, t4
    or t0, t2, t0
    xor t0, t0, t3
    xor t1, t1, t2
    rem t0, t0, t1
    mv a0, t0
    ret
