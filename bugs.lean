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


/-- https://godbolt.org/z/z9nevK834
  we prove this rewrite is incorrect
-/
theorem add_refinement_globalisel :
    ¬ ∀ (x : LLVM.Int 64),
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
  simp only [Classical.not_forall]
  /-
    We obtain from `bv_decide` the counterexample and use it to prove the incorrectness
    of the rewrite.

    Consider the following assignment:
      x.isPoison = false
      x.getValueD = 9223372036854775807#64
  -/

  simp -failIfUnchanged only [veir_bv_normalize]
  simp +contextual -failIfUnchanged [veir_bv_normalize_post, -BitVec.extractLsb_toNat]
  let x : LLVM.Int 64 := .val 9223372036854775807#64
  exists x

/--
  info: 'Veir.Data.RISCV.add_refinement_globalisel' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in
#print axioms add_refinement_globalisel

/-- https://godbolt.org/z/8T6cWKEhj -/
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
/--
info: 'Veir.Data.RISCV.add_refinement_selectiondag' depends on axioms: [propext,
 Classical.choice,
 Quot.sound,
 add_refinement_selectiondag._native.bv_decide.ax_1_5]
-/
#guard_msgs in
#print axioms add_refinement_selectiondag

theorem mul_refinement_selectiondag {x : LLVM.Int 64} :
    (
      let const := Data.LLVM.Int.constant 64 (-1)
      let neg := Data.LLVM.Int.mul x const (nuw := true)
      Data.LLVM.Int.and x neg
    )
     ⊒
      (RISCV.Reg.toInt (
        let input := (LLVM.Int.toReg x)
        let one := Data.RISCV.li 0#64
        let two := Data.RISCV.sub one input
        Data.RISCV.and input two
      ) 64) := by
  veir_bv_decide

theorem mul_refinement_globalisel {x : LLVM.Int 64} :
    (
      let const := Data.LLVM.Int.constant 64 (-1)
      let neg := Data.LLVM.Int.mul x const (nuw := true)
      Data.LLVM.Int.and x neg
    )
     ⊒
      (RISCV.Reg.toInt (
        let input := (LLVM.Int.toReg x)
        let one := Data.RISCV.li 0#64
        Data.RISCV.sub one input
      ) 64) := by
  veir_bv_decide
