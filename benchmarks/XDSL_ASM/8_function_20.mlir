.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t1, a1
    mv t3, a2
    sra t1, t0, t1
    rem t3, t1, t3
    zext.w t2, t3
    srl t2, t2, t3
    divu t1, t1, t2
    and t0, t0, t1
    mv a0, t0
    ret
