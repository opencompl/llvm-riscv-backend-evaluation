.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t1, a1
    mv t0, a2
    and t0, t0, t1
    srl t2, t2, t0
    remu t2, t2, t1
    xor t2, t2, t2
    xor t0, t0, t2
    remu t0, t0, t1
    mv a0, t0
    ret
