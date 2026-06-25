.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t0, a1
    mv t2, a2
    or t2, t1, t2
    srl t2, t0, t2
    divu t0, t0, t2
    xor t0, t0, t1
    mv a0, t0
    ret
