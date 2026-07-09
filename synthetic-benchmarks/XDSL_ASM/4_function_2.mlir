.text
.globl func0
.p2align 2
func0:
    rem a0, a0, a1
    slli a2, a2, 1
    sub a1, a1, a2
    sra a0, a0, a1
    ret
