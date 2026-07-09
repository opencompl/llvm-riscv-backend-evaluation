.text
.globl func0
.p2align 2
func0:
    mul t1, a0, a1
    xor t1, a0, t1
    rem a1, a1, t1
    sub t0, t0, a1
    sra a2, a2, a0
    sll t0, t0, a2
    mv a0, t0
    ret
