.text
.globl func0
.p2align 2
func0:
    sra t0, a0, a1
    mul t1, a0, t0
    or a0, a0, a2
    sll t0, t0, a2
    divu a1, a1, t0
    mul a0, a0, a1
    remu t1, t1, a0
    mv a0, t1
    ret
