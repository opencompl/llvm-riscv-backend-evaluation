.text
.globl func0
.p2align 2
func0:
    mul t0, a0, a1
    sub a2, a2, a0
    xor a0, a1, a2
    div a2, t0, a2
    mul a1, a1, a0
    sra a2, a2, a1
    sra a0, a0, a2
    remu t0, t0, a0
    mv a0, t0
    ret
