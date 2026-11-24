---
name: write-spec
description: Use when the beginner wants to plan a new app, feature, or change (or says "spec", "plan", "I want to add...", or runs /spec). Interviews them in plain language, lays out trade-offs for them to decide, then writes a spec in specs/ with phases and testable success criteria for each phase.
---

# Write a spec

A spec is the written plan for one feature. Explain it as: "Like a recipe before cooking:
what we're making, the steps, and how we'll know each step came out right."

## 0. The vision comes first

- If `specs/00-vision.md` doesn't exist or isn't confirmed, **stop**: run the `app-interview`
  skill first, explaining why in one line.
- Read it. Use its "Questions for later specs", "Recommended architecture", "Hard parts"
  and "Draft roadmap" to decide which spec this is and what to ask. Don't re-ask anything
  it already answers.
- If the feature they want isn't on the roadmap, or contradicts the vision, say so and ask
  whether to update the vision first.

## 1. Interview (plain language, a few questions per message)

Go in rounds. Don't dump every question at once. Skip questions that are already answered,
including the ones the vision answers.

**What it is**
- What should someone be able to do when this is finished? Walk me through it like a story.
- Who uses it? Just you, friends, or the public?
- What's the smallest version that would already be useful? (This becomes phase 1.)
- What should it definitely **not** do yet?

**Screens**
- What screens or pages do you picture? What's on each one?
- Phone, computer, or both?

**Architecture: the big choices** (only in spec 01, or when a feature changes them)
Start from the vision's draft recommendations. Turn each one into a decision they confirm
or change, with options, plain costs, and your recommendation tied to what they said in the
interview. Common ones:
- **Where it runs:** a website (works everywhere, easiest to start), a phone app (app store,
  more setup), or a desktop app.
- **Where the data lives:** only on this device (simple, no accounts, lost if the device
  is lost) or on a server (syncs between devices and people, needs accounts and hosting).
- **Accounts/login:** none yet (fastest), or log in (needed if people share data, more work).
- **Cost:** free hosting tiers vs paid. What happens if lots of people use it?
- **Tools:** recommend boring, popular choices with lots of beginner help online. Say what
  they are in one sentence each.

For each choice say what it **rules out later** and how hard it would be to change.
Record what they pick and why in the spec's Decisions.

**Trade-offs to flag** whenever they come up: speed vs doing it properly, more features vs
finishing sooner, convenience vs privacy, and building it ourselves vs using a ready-made
service.

## 2. Write the spec

File: `specs/NN-short-name.md` (next number). Add a row to `specs/README.md`. Use this
template:

```markdown
# Spec NN: <Name>

- Status: Draft, waiting for approval
- Date: <today>

## Why
<2–4 sentences in the user's own words: the problem and who it helps.>

## What it does
<A short story of using it once it's finished.>

## Decisions
- <Choice>: <what was picked>, because <why>. (Rules out: <...>)

## Not in this spec
- <Things deliberately left for later.>

## Phases

| Phase | What it does (plain words) | Status |
|---|---|---|
| 1 | ... | not started |
| 2 | ... | not started |

### Phase 1: <name>
What gets built: <short bullet list>
Mockup: `mockups/<file>.html` (if it has a screen)

**Done when:**
- [ ] *(Test)* <an automated test that proves X>
- [ ] *(By hand)* Open <...>, do <...> → you see <...>

### Phase 2: ...

## Open questions
- <Anything not decided yet.>
```

Rules for phases:
- **Phase 1 is the smallest useful thing**, ideally something they can see working.
- Each phase is small enough to build and check in one sitting.
- Each phase **ends with something visible or testable**. No phase that's "set up stuff"
  with nothing to check.
- Every "Done when" item is checkable: an automated test, or a by-hand step with a clear
  expected result. "Works well" or "looks nice" aren't criteria.
- Usually 2–5 phases. If there are more, suggest splitting into two specs.

## 3. Review with them

Walk them through it in 5–6 lines, not the whole file. Ask: "Anything wrong or missing?"
Change it until they say **approved**, then set Status to "Approved" and commit:
`git commit -m "spec NN: <name>"`.

End with the "Where we are / Next / Why" block. Next is either **mockups** (if the spec has
screens without an approved mockup) or **build phase 1**.
