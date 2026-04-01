-- We define a theorem that models the island's rules and the specific statements.

theorem knights_knaves
  (A B C : Prop)
  (hA : A ↔ ¬ A ∧ ¬ B ∧ ¬ C)  -- A: "All of us are knaves"
  (hB : B ↔ (A → ¬ C))        -- B: "If A is a knight, then C is a knave"
  (hC : C ↔ ¬ (A ↔ B)) :        -- C: "A and B are of different types"
  ¬ A ∧ B ∧ C := by

  -- step 1 prove A is a knave (¬ A)
  -- if A were true, A's statement would mean A is false, which is a contradiction.
  have h_notA : ¬A := by
    intro ha
    have h_and := hA.mp ha
    -- h_and.1 extracts ¬A from the logical AND
    exact h_and.1 ha

  -- step 2 prove B is a knight (B)
  -- B's statement is an implication (A → ¬ C). Since A is false, the implication is vacuously true. Therefore, B's statement is true, making B a knight.
  have h_B : B := by
    apply hB.mpr
    intro ha
    -- We have 'ha : A' but we already proved 'h_notA : ¬A'. This is a contradiction, so anything follows, including ¬C.
    contradiction

  -- step 3 prove C is a knight (C)
  -- C says A and B are different. we know A is false and B is true, thus the statement must be true. We prove it by contradiction.
  have h_C : C := by
    apply hC.mpr
    intro h_iff
    -- if A and B were the same type (A ↔ B), since B is a knight, A would also have to be knight. this contradicts our proof that A is a knave.
    have ha : A := h_iff.mpr h_B
    contradiction

  -- finally, we construct the required conjunction (¬ A ∧ B ∧ C)
  exact ⟨h_notA, h_B, h_C⟩
