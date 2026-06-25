.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t1, a1
    sext.w t0, t0
    zext.w t1, t1
    div t1, t1, t0
    srl t0, t0, t1
    mv a0, t0
    ret
