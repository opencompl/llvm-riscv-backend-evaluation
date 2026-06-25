.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t2, a1
    and t0, t1, t1
    or t1, t1, t2
    rem t0, t0, t1
    mv a0, t0
    ret
