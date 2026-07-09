.text
.globl func0
.p2align 2
func0:
    or t0, a1, a2
    rem a2, a2, t0
    sub a1, a1, a2
    sll a0, a0, a1
    ret
