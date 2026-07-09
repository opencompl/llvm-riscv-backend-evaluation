.text
.globl func0
.p2align 2
func0:
    or t0, a0, a1
    xor a2, a2, t0
    sll a2, a0, a2
    divu a2, a2, a0
    add a1, a1, a2
    mul a1, a2, a1
    or a2, a2, a1
    mv a0, a2
    ret
