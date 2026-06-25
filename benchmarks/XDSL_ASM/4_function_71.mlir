.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t2, a1
    sra t0, t1, t1
    srl t0, t0, t2
    div t1, t1, t1
    divu t0, t0, t1
    mv a0, t0
    ret
