.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t4, a1
    mv t1, a2
    sext.w t2, t4
    and t0, t2, t2
    sext.w t4, t4
    remu t4, t1, t4
    srl t0, t0, t4
    and t0, t0, t3
    remu t1, t1, t2
    remu t0, t0, t1
    mv a0, t0
    ret
