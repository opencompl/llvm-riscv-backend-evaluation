.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    rem t2, t0, t0
    srl t1, t0, t2
    or t1, t1, t0
    sext.w t0, t1
    rem t1, t1, t2
    remu t0, t0, t1
    mv a0, t0
    ret
