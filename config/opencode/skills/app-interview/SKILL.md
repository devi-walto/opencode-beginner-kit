---
name: app-interview
description: MANDATORY first step for every new project, right after start-project and before any spec, mockup or code (or when they run /interview, or there's no specs/00-vision.md). Interviews the beginner about the app they picture in their head, plays the picture back for them to confirm, and writes specs/00-vision.md. That file holds the vision, a draft roadmap of specs, the architecture that fits with recommendations, the hard parts, and the questions to ask later.
---

# The app interview (the vision)

This comes before every spec. Explain why in one line: "Before planning any piece, I need
to see the whole app the way you see it. That's how I know which questions to ask and
which tools fit."

## How to run it

- Keep it a conversation. **Ask 2–3 questions per message**, in the rounds below, in plain
  words. React to what they say ("Oh, so it's like a shared shopping list for families?").
- **Ask them to describe it as a movie:** "Picture someone opening your app for the first
  time. What do they see? What do they tap? What happens next?"
- When an answer is vague, ask for an example ("What's one thing you'd save in it?").
- Don't pitch tools or tech yet. Just listen and picture it. Tech comes at the end, in
  plain words.
- "I don't know" is a fine answer. Write it down as an open question and move on.
- Skip rounds that are already answered. It should take about 10–20 minutes.

## Round 1: The picture in your head
- In one or two sentences, what is the app?
- Why do you want it? What's annoying or missing today that it fixes?
- Is there an app or website that's a bit like it? What would you keep from it, and what
  would you change?

## Round 2: The people
- Who uses it? Just you, friends and family, a group (a team, a class, a business), or anyone?
- Roughly how many people in the first few months? 1, 10, 100, 1000+?
- Do people need to see each other's stuff, or is everyone's stuff private?

## Round 3: The movie (walk me through it)
- Someone opens it for the first time. What's the first screen?
- What are the 3 most important things someone does in it?
- What does a normal day of using it look like? How often would they open it?
- Is there anything they'd do with someone else (share, chat, invite, compete)?

## Round 4: Where and how
- Phone, computer, or both? If phone, do you picture it in the app store, or would a website
  that works well on a phone be fine?
- Should it work without internet (in a gym, on a plane)?
- Does it need the camera, location, notifications, or anything else on the phone?
- Does it connect to anything else (Google Calendar, Spotify, payments, a spreadsheet)?

## Round 5: The stuff it keeps
- What information does it save? (Lists, photos, scores, messages...)
- Is any of it private or sensitive? (Health, money, kids' info, addresses)
- If someone loses their phone, should their stuff still be there?

## Round 6: Money, time and your goals
- Free, paid, ads, or not sure yet? (It's fine not to know.)
- Any budget for hosting or services? $0, a few dollars a month, more?
- Is there a date you want something working by?
- What matters more to you right now: **learning how to build** or **getting it working
  fast**? (This changes how much I explain versus just do.)
- What would make you say "this was worth it" in 3 months?

## Then: Play it back

Before writing anything, describe the app back to them in 5–8 plain lines, like a short
story of someone using it. Ask: **"Is that what's in your head? What's wrong or missing?"**
Fix it until they say yes.

## Write `specs/00-vision.md`

```markdown
# Vision: <App name>

- Interviewed: <date>
- Status: Confirmed by <name>

## The picture (their words)
<The 5–8 line story they confirmed.>

## Why it exists
<The problem, in their words.>

## Who it's for
- Users: <who> · First few months: <how many> · Sharing: <private / shared / public>

## The 3 most important things it does
1. ...

## Like these apps
- <App>: keep <...>, change <...>

## Where it runs and what it needs
- Device: <...> · Offline: <yes/no> · Phone features: <...> · Connects to: <...>

## Data it keeps
- <What> · Sensitive: <yes/no, what> · Must survive a lost phone: <yes/no>

## Money, time, goals
- Pricing: <...> · Budget: <...> · Target date: <...> · Learn vs fast: <...>
- Worth it in 3 months if: <...>

## Recommended architecture (draft, decided in spec 01)
In plain words, what fits this picture and why. Each item has a recommendation, what it
costs, what it rules out, and the simpler alternative:
- Where it runs: <recommendation> because <reason from the interview>
- Where data lives: <...>
- Accounts/login: <...>
- Tools: <boring, popular, beginner-friendly picks, one sentence each>
- Hosting/cost: <...>

## Hard parts to know about early
- <e.g. "Real-time chat is a big step up in difficulty", "App store review takes days
  and costs $99/yr for iPhone", "Payments add legal and security work">

## Draft roadmap of specs
| # | Spec | What it delivers | Why in this order |
|---|---|---|---|
| 01 | <smallest useful version> | ... | proves the core idea first |
| 02 | ... | ... | ... |

## Questions for later specs
- Spec 01: <the specific questions this app raises>
- Later: <...>

## Open questions
- <Everything they answered "I don't know" to.>
```

Rules for the recommendations:
- Base every recommendation on something they said, and point to it ("because you said it
  needs to work in the gym without Wi-Fi").
- Prefer the **simplest thing that fits the picture**. Flag where the picture forces
  something harder (sharing, real-time, the app store, payments, sensitive data).
- If they said "learn", lean toward tools that teach well. If they said "fast", lean toward
  tools that do more for you.
- Spec 01 is the smallest version that already shows the core idea working.

## Finish

1. Show them the **Recommended architecture**, **Hard parts** and **Draft roadmap**
   sections (not the whole file), and ask if anything surprises them.
2. Update the project's `AGENTS.md`: the "What it is", "Who it's for", "Tech choices
   (draft)" and "Vision: specs/00-vision.md" lines.
3. Commit: `git commit -m "vision: <app name>"`.
4. End with the "Where we are / Next / Why" block. Next is **spec 01** (`/spec`), where the
   draft architecture becomes real decisions.

If the vision changes a lot later (a new kind of user, a new device, a pivot), offer to
redo the affected rounds and update this file before writing the next spec.
