---
name: html-mockup
description: Use when a spec has screens that need designing, or the beginner wants to see what something will look like (or says "mockup", "show me", "what will it look like", or runs /mockup). Makes simple HTML mockups in mockups/ that open in a browser, iterates until approved, and keeps them as the design the real screens must match.
---

# HTML mockups

Explain it as: "A picture of the screen before we build it. Changing a picture is quick;
changing a built app takes much longer."

## Rules

- One HTML file per screen: `mockups/NN-screen-name.html` (NN = the spec number). Use plain
  HTML and CSS in one file, with no build tools, so it opens with a double-click.
- Put the colours, fonts and spacing in `mockups/theme.css` and link it from every mockup.
  That file later becomes the app's real theme. Same DRY rule as the app: one button style
  and one card style, reused everywhere.
- Use realistic fake content ("Grandma's Tacos", not "Lorem ipsum") so it feels real.
- Show the important **states**: empty (nothing added yet), normal, error, and loading if
  it's slow. Put them side by side or behind small tabs on the same page.
- For phone screens, wrap the page in a phone-width frame (about 390px wide).
- Links between mockup pages can work (clicking "Add" opens the add page), so they can
  click through the flow. No real logic or saving.
- Add a small note box at the top: which spec and phase this screen belongs to, and
  anything still undecided.

## Process

1. Ask 2–3 quick questions if the spec doesn't already say: anything you've seen that you
   like? Light or dark? Any colours you love or hate?
2. Make the mockups and tell them how to open them in their browser:
   - Windows WSL: `explorer.exe "$(wslpath -w mockups/01-list.html)"`
   - Mac: `open mockups/01-list.html` · Linux: `xdg-open mockups/01-list.html`
3. Ask what to change. Change only what they asked, and tell them what changed.
4. When they say **approved**, write "Approved <date>" in the note box, link the mockup
   from its phase in the spec, and commit: `git commit -m "mockups: <screen>"`.

End with the "Where we are / Next / Why" block. Next is usually **build phase 1**.
