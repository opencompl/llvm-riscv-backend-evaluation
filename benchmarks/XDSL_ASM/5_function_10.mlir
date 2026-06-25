.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t1, a1
    zext.w t0, t2
    srl t1, t0, t1
    rem t1, t1, t2
    remu t0, t0, t1
    mv a0, t0
    ret
