.text
.globl func0
.p2align 2
func0:
    srl t0, a0, a1
    rem t0, t0, a0
    div t1, a2, a0
    sub a0, a0, a2
    mul a1, a1, a0
    rem t1, t1, a1
    sll t1, t0, t1
    add t0, t0, t1
    mv a0, t0
    ret
