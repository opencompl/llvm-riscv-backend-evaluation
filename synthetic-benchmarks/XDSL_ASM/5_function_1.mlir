.text
.globl func0
.p2align 2
func0:
    divu a0, a0, a1
    xor a1, a1, a2
    mul a1, a1, a0
    mv a0, a1
    ret
