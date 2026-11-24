---
name: start-project
description: Use when the beginner wants to start a new app or project (or says "new project", "I want to build...", or runs /start). Sets up a clean folder with git, a README, specs/ and mockups/ folders, a project AGENTS.md, and the first commit, explaining each step in plain words.
---

# Start a new project

The user is a beginner. Explain each step in one plain sentence as you do it.

## 1. Ask first (plain language, 2–3 questions max)

- What's the app called? A working name is fine and can change later.
- In one or two sentences, what does it do and who is it for?
- Where should the folder go? Suggest `~/Projects/<name>`. On Windows with WSL, always keep
  it on the Linux side (`~/...`), never under `/mnt/c/`, and explain that it's faster and
  avoids line-ending mix-ups.

## 2. Set up the folder

Make the folder, then create:

```
<name>/
  README.md        what it is + how to run it (fill in "how to run" once there's code)
  AGENTS.md        project notes for the agent (see below)
  .gitignore       secrets, dependencies and build output never get saved to git
  specs/
    README.md      list of specs and their status (table: #, name, what it delivers, status)
  mockups/         HTML mockups of screens, approved before building
```

`.gitignore` should cover at least: `.env`, `.env.*`, `node_modules/`, `dist/`, `build/`,
`__pycache__/`, `.venv/`, `.DS_Store`. Explain: "This is the list of files git should never
save, like passwords and stuff the computer can rebuild."

Project `AGENTS.md` (short):

```markdown
# <App name>

What it is: <one or two sentences, the user's words>
Who it's for: <...>
Vision: specs/00-vision.md (written by the app interview, required before any spec)
Tech choices: (draft after the interview, decided in spec 01)
Current spec: none yet
Shortcuts we took on purpose: (none yet)
```

## 3. Switch git on and make the first save point

```bash
git init -b main
git add .
git commit -m "start project"
```

Explain: "git keeps save points of the project. We just made the first one. If anything
goes wrong later, we can always come back here."

Check that git knows who they are (`git config user.name`). If it's empty, ask for their
name and email and set them globally, explaining it's just a label on save points.

**GitHub backup (offer it, and ask first).** If `gh auth status` shows they're signed in,
offer to put the project on GitHub as a **private** repo. Explain in one line: an online
copy of every save point, so nothing is lost if the computer dies. If they say yes:

```bash
gh repo create <name> --private --source . --remote origin --push
```

Explain private vs public in one line (public means anyone can see the code). From then on,
after each finished phase, **ask** before running `git push`. If they're not signed in,
skip this and mention they can run `gh auth login` later.

## 4. Hand off

Go straight into the **app interview** (the `app-interview` skill). It's required before
any spec. Say why in one line: "Before we plan any piece, I need to see the whole app the
way you see it in your head." If they want to stop for now, end with the "Where we are /
Next / Why this step" block, with Next = `/interview`.
