.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    zext.w t1, t0
    rem t0, t0, t1
    sext.w t0, t0
    mv a0, t0
    ret
