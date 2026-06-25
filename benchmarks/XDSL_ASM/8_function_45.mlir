.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t0, a1
    mv t1, a2
    rem t2, t3, t3
    srl t3, t3, t3
    remu t2, t2, t3
    sext.w t0, t0
    sra t0, t2, t0
    and t1, t1, t1
    rem t1, t1, t2
    srl t0, t0, t1
    mv a0, t0
    ret
