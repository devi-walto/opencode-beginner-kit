---
name: dry-check
description: Use when the beginner asks to check or clean up the code (or says "check my code", "DRY check", "clean up", "review", or runs /check), and before a spec's last phase is merged. Finds copied code, hand-made duplicates of shared components, and colours typed outside the theme, then explains each in plain words and offers fixes without changing anything until they say yes.
---

# DRY check (don't repeat yourself)

Explain it first: "We're looking for things we wrote twice. Copies drift apart. You fix a
bug in one and the other one keeps it."

## What to look for

1. **Hand-made copies of shared components:** a button, card, list row or dialog written
   by hand when a shared one exists.
2. **Copied logic:** the same calculation or check in two or more places.
3. **Loose style values:** colours, font sizes or spacing typed straight into a screen
   instead of coming from the theme file.
4. **Near-twins:** two components that differ only in size or colour. That should be one
   component with an option.
5. **Dead code:** files or functions nothing uses any more.

## How to report

Show a short ranked list, worst first. For each finding give:
- what it is, in one plain sentence
- where it is (file and line)
- what could go wrong because of it ("if we change the button colour, this one stays blue")
- the fix, in one sentence

**Change nothing until they say which ones to fix.** Then fix those, run the tests, and
commit: `git commit -m "clean up: <what>"`.

End with the "Where we are / Next / Why" block.
