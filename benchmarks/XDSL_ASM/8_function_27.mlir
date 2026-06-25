.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t3, a1
    mv t2, a2
    czero.eqz t1, t0, t3
    czero.nez t2, t2, t3
    or t1, t1, t2
    sra t1, t1, t0
    and t1, t1, t0
    srl t2, t0, t0
    sra t1, t1, t2
    sext.w t1, t1
    remu t0, t0, t1
    mv a0, t0
    ret
