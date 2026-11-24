---
name: whats-next
description: Use when the beginner seems lost, comes back after a break, or asks "where are we", "what now", "what's next", or runs /next. Reads the project's specs, mockups and git state and gives a short recap plus the single next step and why.
---

# What's next

1. Look at:
   - `specs/README.md` and the current spec's phase table
   - `mockups/` (which ones are approved)
   - `git status`, `git branch --show-current` and `git log --oneline -5`
2. Reply with **no more than**:

> **The project:** <one sentence>
> **Done so far:** <one or two lines>
> **Where we are:** <the current spec and phase, and its status>
> **Next step:** <one concrete action, and the command to run, like /build>
> **Why:** <one sentence>

3. If `specs/00-vision.md` is missing, the next step is **always** `/interview`, whatever
   else exists. Use the vision's draft roadmap to say which spec comes after the current one.
4. Add a warning **only** if something's off:
   - work that isn't committed: offer to commit it
   - code with no spec behind it: offer to write one, or note it as a shortcut
   - a phase that was built but not checked: run its checklist first
   - on `main` while a spec is in progress: switch to its branch

Then a small table of all specs (number, name, what it delivers, status). Keep it short.
