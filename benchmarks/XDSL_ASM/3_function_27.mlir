.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    zext.w t0, t1
    or t0, t0, t1
    mv a0, t0
    ret
