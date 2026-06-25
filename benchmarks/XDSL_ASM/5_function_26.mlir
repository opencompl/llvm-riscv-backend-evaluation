.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    remu t0, t1, t1
    xor t0, t0, t1
    sext.w t0, t0
    mv a0, t0
    ret
