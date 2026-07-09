.text
.globl func0
.p2align 2
func0:
    rem a0, a0, a1
    addi a0, a0, -1
    mul a2, a2, a0
    mv a0, a2
    ret
