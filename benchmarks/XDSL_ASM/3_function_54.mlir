.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    slt t2, t1, t1
    xori t2, t2, 1
    czero.eqz t0, t1, t2
    czero.nez t1, t1, t2
    or t0, t0, t1
    mv a0, t0
    ret
