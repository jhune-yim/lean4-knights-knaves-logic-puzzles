theorem knights_knaves
  (A B C : Prop)
  (hA : A ↔ ¬ A ∧ ¬ B ∧ ¬ C)   -- A: "All of us are knaves"
  (hB : B ↔ (A → ¬ C))         -- B: "If A is a knight, then C is a knave"
  (hC : C ↔ ¬ (A ↔ B)) :       -- C: "A and B are of different types"
  ¬ A ∧ B ∧ C := by

  -- Step 1: A is a knave
  have hNotA : ¬ A := by
    intro ha
    have hAnd : ¬ A ∧ ¬ B ∧ ¬ C := hA.mp ha
    exact hAnd.1 ha

  -- Step 2: B is a knight
  have hBTrue : B := by
    apply hB.mpr
    intro ha
    exact False.elim (hNotA ha)

  -- Step 3: C is a knight
  have hCTrue : C := by
    apply hC.mpr
    intro hAB
    exact hNotA (hAB.mpr hBTrue)

  exact ⟨hNotA, hBTrue, hCTrue⟩
