.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    divu t1, t0, t0
    div t0, t0, t1
    divu t0, t0, t0
    sext.w t0, t0
    mv a0, t0
    ret
