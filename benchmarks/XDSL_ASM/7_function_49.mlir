.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t2, a1
    mv t1, a2
    divu t2, t0, t2
    div t2, t0, t2
    sra t0, t0, t2
    remu t1, t0, t1
    srl t0, t0, t2
    or t0, t0, t1
    mv a0, t0
    ret
