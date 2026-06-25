.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t2, a1
    mv t1, a2
    sra t0, t0, t2
    sext.w t1, t1
    remu t1, t1, t0
    and t2, t2, t0
    divu t1, t1, t2
    rem t1, t1, t2
    div t0, t0, t1
    mv a0, t0
    ret
