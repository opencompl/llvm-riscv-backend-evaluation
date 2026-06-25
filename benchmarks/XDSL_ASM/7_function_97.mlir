.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t1, a1
    remu t2, t0, t0
    zext.w t1, t1
    srl t1, t2, t1
    sext.w t1, t1
    xor t1, t1, t2
    sra t0, t0, t1
    mv a0, t0
    ret
