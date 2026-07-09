.text
.globl func0
.p2align 2
func0:
    slli t0, a0, 1
    add a1, a1, t0
    div a0, a0, a1
    ret
