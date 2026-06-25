.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t1, a1
    or t0, t1, t2
    or t2, t2, t0
    srl t0, t0, t2
    srl t0, t0, t1
    mv a0, t0
    ret
