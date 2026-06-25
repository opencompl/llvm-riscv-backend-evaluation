.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t0, a1
    mv t2, a2
    divu t3, t1, t1
    sext.w t3, t3
    sra t1, t1, t3
    or t0, t2, t0
    divu t0, t0, t2
    and t0, t0, t1
    mv a0, t0
    ret
