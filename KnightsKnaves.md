 # Formal proof, propositions as types and Lean 4: A mathematician's initial exploration of Lean 4 and formal proof

This records an initial exploration of Lean 4 as a formal language for mathematics, focusing on basic group theoretic proofs and the way Lean encodes ordinary mathematical reasoning through tactics, lemmas, and type checking. Working directly with Lean made concrete several foundational ideas that are often encountered only abstractly, especially the propositions as types perspective associated with the Curry-Howard correspondence, according to which a proof is understood as a term inhabiting a type. This hands on experience also clarified the broader conceptual among proof assistants, type theory, category theory, and homotopy type theory, showing how formalisation can sharpen mathematical understanding by forcing explicit attention to structue, inference, and construction.


# Knights and Knaves Logic Puzzles in Lean 4

## Lean theorem

The core theorem has the following shape:

```
theorem knights_knaves
  (A B C : Prop)
  (hA : A ↔ ¬ A ∧ ¬ B ∧ ¬ C)
  (hB : B ↔ (A → ¬ C))
  (hC : C ↔ ¬ (A ↔ B)) :
  ¬ A ∧ B ∧ C := by
  ...
```

## Mathematical idea

The proof proceeds in three steps:

1. A cannot be a knight.
    If A were true, then A's own statement would imply ¬A, contradiction.

2. B must be a knight.
    Since A is false, the implication A → ¬C is vacuously true, so B's statement is true.

3. C must be a knight.
    Since A is false and B is ture, A and B are indeed different types, so C's statement is true.

## Goals of the project

This repo is intended as a small example of:
- formalising informal logical puzzles in Lean 4
- using propositions as truth conditions for statements
- writing readable tactic proofs in Lean
- connecting classical puzzle-solving with theorem proving

## How to build

Assuming one already have Lean 4 installed:

```
lake build
```
