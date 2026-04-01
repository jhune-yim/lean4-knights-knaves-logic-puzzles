# knights knaves in Lean 4

A small Lean 4 formalisation of a classic **Knights and Knaves** logic puzzle.

On an island, each inhabitant is either:

- a **Knight**, who always tells the truth, or
- a **Knave**, who always lies.

This project encodes one such puzzle in Lean 4 and proves the unique logical outcome.

## Problem

We model three inhabitants `A`, `B`, and `C` with the following statements:

- **A**: "All of us are knaves."
- **B**: "If A is a knight, then C is a knave."
- **C**: "A and B are of different types."

Using propositional logic and Lean 4, we prove:

- `A` is a knave
- `B` is a knight
- `C` is a knight

That is, the final result is:

```lean
¬ A ∧ B ∧ C
