---
name: build-phase
description: Use when the beginner wants to build the next part of an approved spec (or says "build", "let's code", "start phase N", or runs /build). Builds exactly one phase, reuses shared pieces (DRY), writes tests, runs the success criteria, shows them how to check it by hand, commits, and stops.
---

# Build one phase

## 0. Check we're allowed to start

- Is there a confirmed `specs/00-vision.md`? If not, run `/interview` first. No exceptions.
- Is there a spec in `specs/` with Status "Approved"? If not, explain kindly why we write
  it first, and offer `/spec`. (A tiny fix like a typo or colour is fine without one.)
- Which phase is next? It's the first one in the phase table that isn't done. Say which
  one and what it builds, in one sentence.
- If the phase has a screen, is its mockup approved? If not, offer `/mockup` first.
- Is the work committed (`git status` clean)? If not, commit or ask about the leftovers first.
- Is this the spec's first phase? Then make its branch: `git switch -c feature-short_name`,
  and explain branches in one line.

## 1. Look before you write (DRY)

Load the `project-structure` skill (or follow the project's "Folder layout" in its
`AGENTS.md`). Before writing code, search the project for things you can reuse: components, helpers,
the theme file, similar screens. Tell them in one or two lines what you're reusing and
what's new. If something new will be used in more than one place, make it a shared piece
first. If you spot an existing copy, mention it and offer to fold it in.

## 2. Build only this phase

- Build exactly what the phase says. If you notice something else worth doing, **write it
  down** in the spec's Open questions or a later phase. Don't build it now.
- Screens must match the approved mockup: layout, wording and colours from the theme file.
- Start new code files with a short plain-language comment saying what the file is for.
- Narrate briefly as you go ("Now making the list screen…"). No walls of code in chat
  unless they ask.

## 3. Check it

- Write the automated tests from the phase's "Done when" list and run them. Show the
  result in plain words: "5 tests, all passed. They prove: ...".
- If something fails, explain what went wrong in plain words, fix it, and run again.
- Give them the **by-hand steps** from the checklist, with the exact command to start the
  app, and ask them to try it. This is their review. Wait for their answer.
- Tick off the checklist in the spec and set the phase to "done" in the phase table.

## 4. Save and stop

- Commit (`git add -A`, then `git commit -m "spec NN phase N: <what it does>"`). Explain
  that this is the save point for the phase.
- Update the README if how to run the project changed.
- **If it was the last phase:** set the spec's Status to "Done", merge the branch into
  `main` (`git switch main`, then `git merge feature-short_name`), and update `specs/README.md`.
  Ask before pushing anywhere.
- **Stop.** Don't start the next phase on your own.

End with the "Where we are / Next / Why" block, plus a tiny progress table for the spec
(phase, what it does, status).
