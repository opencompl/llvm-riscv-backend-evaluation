.text
.globl func0
.p2align 2
func0:
    srl t0, a1, a2
    or a2, a0, a2
    mul t1, a0, a2
    mul t0, t0, t1
    mul a0, a0, a1
    add a0, a0, a2
    remu a2, a2, a0
    add t0, t0, a2
    mv a0, t0
    ret
