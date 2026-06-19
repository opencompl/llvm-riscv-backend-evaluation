import Veir.Data.RISCV.Reg.Basic
import Veir.Data.RISCV.Reg.Lemmas
import Veir.Data.LLVM.Int.Basic
import Veir.Data.LLVM.Int.Lemmas
import Veir.Data.LLVM.Int.Bitblast
import Veir.Data.Casting
import Veir.Data.Refinement
import Std.Tactic.BVDecide

/-!
  In this file we prove the correctness of the lowering patterns used in the
  instruction selection rewrites.
-/

namespace Veir.Data.RISCV


theorem add_refinement_globalisel {x : LLVM.Int 64} :
    (
      let one := Data.LLVM.Int.add x x
      let const := Data.LLVM.Int.constant 64 1
      let two := Data.LLVM.Int.sub const one
      let three := Data.LLVM.Int.add x two (nuw := true)
      Data.LLVM.Int.and three const
    )
     ⊒
      (RISCV.Reg.toInt (
        let input := (LLVM.Int.toReg x)
        let one := Data.RISCV.li 1#64
        Data.RISCV.sub one input
      ) 64) := by
  /-
    Consider the following assignment:
      x.isPoison = false
      x.getValueD = 9223372036854775807#64
  -/
  sorry

theorem add_refinement_selectiondag {x : LLVM.Int 64} :
    (
      let one := Data.LLVM.Int.add x x
      let const := Data.LLVM.Int.constant 64 1
      let two := Data.LLVM.Int.sub const one
      let three := Data.LLVM.Int.add x two (nuw := true)
      Data.LLVM.Int.and three const
    )
     ⊒
      (RISCV.Reg.toInt (
        let input := (LLVM.Int.toReg x)
        let one := Data.RISCV.li 1#64
        let two := Data.RISCV.sub one input
        Data.RISCV.andi 1#12 two
      ) 64) := by
  veir_bv_decide
