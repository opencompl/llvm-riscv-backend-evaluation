.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t2, a1
    mv t1, a2
    and t0, t2, t3
    sext.w t0, t0
    divu t1, t1, t3
    divu t0, t0, t1
    rem t1, t1, t2
    rem t0, t0, t1
    mv a0, t0
    ret
