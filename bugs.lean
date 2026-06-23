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

-------

/-- https://godbolt.org/z/YesPhWvza -/

theorem mul_refinement_globalisel :
    ¬ ∀ (x : LLVM.Int 64),
    (
      let const := Data.LLVM.Int.constant 64 (-1)
      let neg := Data.LLVM.Int.mul x const (nuw := true)
      Data.LLVM.Int.and x neg
    )
     ⊒
      (RISCV.Reg.toInt (
        let input := (LLVM.Int.toReg x)
        Data.RISCV.neg input
      ) 64) := by
  simp only [Classical.not_forall]
  simp -failIfUnchanged only [veir_bv_normalize]
  simp +contextual -failIfUnchanged [veir_bv_normalize_post, -BitVec.extractLsb_toNat]
  let x : LLVM.Int 64 := .val 1#64
  exists x
  -- veir_bv_decide
  /-
  Consider the following assignment:
  x.isPoison = false
  x.getValueD = 1#64
  -/

/--
  info: 'Veir.Data.RISCV.mul_refinement_globalisel' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in
#print axioms mul_refinement_globalisel

theorem mul_refinement_selectiondag {x : LLVM.Int 64} :
    (
      let const := Data.LLVM.Int.constant 64 (-1)
      let neg := Data.LLVM.Int.mul x const (nuw := true)
      Data.LLVM.Int.and x neg
    )
     ⊒
      (RISCV.Reg.toInt (
        let input := (LLVM.Int.toReg x)
        let sub := Data.RISCV.neg input
        Data.RISCV.and input sub
      ) 64) := by
  veir_bv_decide

/--
info: 'Veir.Data.RISCV.mul_refinement_selectiondag' depends on axioms: [propext,
 Classical.choice,
 Quot.sound,
 mul_refinement_selectiondag._native.bv_decide.ax_1_5]
-/
#guard_msgs in
#print axioms mul_refinement_selectiondag

-------

/--
https://godbolt.org/z/onGz7qG7E
-/

theorem cmp_ult_refinement_globalisel  :
    ¬ ∀ (x : LLVM.Int 64) (y : LLVM.Int 64),
    (
      let cmp := Data.LLVM.Int.icmp x y Data.LLVM.IntPred.ult
      let sel := Data.LLVM.Int.select cmp x y
      let trunc := Data.LLVM.Int.trunc sel 31 (false) (false) (by omega)
      let const := Data.LLVM.Int.constant 31 0
      let sub := Data.LLVM.Int.sub trunc const (nuw := true)
      Data.LLVM.Int.sext sub 64 (by omega)
    )
     ⊒
      (RISCV.Reg.toInt (
        let input1 := (LLVM.Int.toReg x)
        let input2 := (LLVM.Int.toReg y)
        let zero := Data.RISCV.li 0#64
        let minu := Data.RISCV.minu input1 input2
        let neg := Data.RISCV.neg minu
        let slli := Data.RISCV.slli 33 neg
        Data.RISCV.srai 33 slli
      ) 64) := by
    simp only [Classical.not_forall]
    simp -failIfUnchanged only [veir_bv_normalize]
    simp +contextual -failIfUnchanged [veir_bv_normalize_post, -BitVec.extractLsb_toNat]
    let x : LLVM.Int 64 := .val 18446744073709551615#64
    let y : LLVM.Int 64 := .val 18446744073709551615#64
    exists x
    constructor
    · grind
    · exists y
    -- veir_bv_decide
    /-
    x.isPoison = false
    y.isPoison = false
    x.getValueD = 18446744073709551615#64
    y.getValueD = 18446744073709551615#64
    -/


/--
  info: 'Veir.Data.RISCV.cmp_ult_refinement_globalisel' depends on axioms: [propext, Classical.choice, Quot.sound]
  -/
#guard_msgs in
#print axioms cmp_ult_refinement_globalisel

theorem cmp_ult_refinement_selectiondag {x : LLVM.Int 64} {y : LLVM.Int 64} :
    (
      let cmp := Data.LLVM.Int.icmp x y Data.LLVM.IntPred.ult
      let sel := Data.LLVM.Int.select cmp x y
      let trunc := Data.LLVM.Int.trunc sel 31 (false) (false) (by omega)
      let const := Data.LLVM.Int.constant 31 0
      let sub := Data.LLVM.Int.sub const trunc (nuw := true)
      Data.LLVM.Int.sext sub 64 (by omega)
    )
     ⊒
      (RISCV.Reg.toInt (
        Data.RISCV.li 0#64
      ) 64) := by
    veir_bv_decide

/--
  info: 'Veir.Data.RISCV.cmp_ult_refinement_selectiondag' depends on axioms: [propext,
 Classical.choice,
 Quot.sound,
 cmp_ult_refinement_selectiondag._native.bv_decide.ax_1_5]
 -/
#guard_msgs in
#print axioms cmp_ult_refinement_selectiondag

-------

/-
https://godbolt.org/z/5Pdb1d7ba
-/

-- This is fixed in upstream LLVM, so in the godbolt link you won't see the bug.
theorem xor_sub_refinement_globalisel :
    ¬ ∀ (x : LLVM.Int 64),
    (
      let mone := Data.LLVM.Int.constant 64 (-1)
      let zero := Data.LLVM.Int.constant 64 0
      let not := Data.LLVM.Int.xor x mone
      let neg := Data.LLVM.Int.sub zero not
      Data.LLVM.Int.and x neg
    )
     ⊒
      (RISCV.Reg.toInt (
        let input1 := (LLVM.Int.toReg x)
        Data.RISCV.andn input1 input1
      ) 64) := by
    simp only [Classical.not_forall]
    simp -failIfUnchanged only [veir_bv_normalize]
    simp +contextual -failIfUnchanged [veir_bv_normalize_post, -BitVec.extractLsb_toNat]
    let x : LLVM.Int 64 := .val 9223372036854775808#64
    exists x
    -- veir_bv_decide
    /-
      x.isPoison = false
      x.getValueD = 9223372036854775808#64
    -/


/--
  info: 'Veir.Data.RISCV.xor_sub_refinement_globalisel' depends on axioms: [propext, Classical.choice, Quot.sound]
 -/
#guard_msgs in
#print axioms xor_sub_refinement_globalisel

theorem xor_sub_refinement_selectiondag {x : LLVM.Int 64} :
    (
      let mone := Data.LLVM.Int.constant 64 (-1)
      let zero := Data.LLVM.Int.constant 64 0
      let not := Data.LLVM.Int.xor x mone
      let neg := Data.LLVM.Int.sub zero not
      Data.LLVM.Int.and x neg
    )
     ⊒
      (RISCV.Reg.toInt (
        let input1 := (LLVM.Int.toReg x)
        let addiw := Data.RISCV.addi 1#12 input1
        Data.RISCV.and input1 addiw
      ) 64) := by
    veir_bv_decide

/--
  info: 'Veir.Data.RISCV.xor_sub_refinement_selectiondag' depends on axioms: [propext,
 Classical.choice,
 Quot.sound,
 xor_sub_refinement_selectiondag._native.bv_decide.ax_1_5]
 -/
#guard_msgs in
#print axioms xor_sub_refinement_selectiondag

----
