---
name: project-structure
description: The reference picture of a clean project. Load it before creating new files or folders, when starting a project, when a spec picks its tools, when deciding where code belongs, and during a DRY check. Shows the general skeleton, what goes in each folder and the rules that keep it clean, so every project grows the same tidy way.
---

# What a clean project looks like

Treat this as a **shape to grow into**, not a list of folders to make on day one. Start with
only what the first spec needs and add folders as phases need them. The names below are
for a typical web app with a front end (what people see) and a back end (the server that
saves data). Adapt them to the tools spec 01 picks (for example `src/` instead of
`frontend/src/`), but **keep the same roles**.

When you explain this to the beginner, compare it to a kitchen: "Every tool has one drawer.
If you always put the spoons in the spoon drawer, you never cook with two half-sets of spoons."

## The skeleton

```
my-app/
├── README.md                 what it is + how to run it, in plain steps
├── AGENTS.md                 notes for the agent: vision, tech choices, shortcuts taken
├── .gitignore                never saved to git: secrets, dependencies, build output
├── .gitattributes            same line endings on every computer (* text=auto eol=lf)
├── .env.example              the settings the app needs, with fake values (the real .env is never committed)
│
├── specs/                    the plans
│   ├── README.md             list of specs: number, name, what it delivers, status
│   ├── 00-vision.md          the app interview: the whole picture, draft architecture, roadmap
│   └── 01-first-feature.md   one file per feature, with phases and "Done when" checklists
│
├── mockups/                  approved HTML pictures of the screens
│   ├── theme.css             the mockups' colours and fonts (becomes the app's tokens file)
│   └── 01-home.html
│
├── docs/                     lasting explanations: why things are built the way they are
│
├── frontend/                 what people see and tap
│   ├── package.json
│   └── src/
│       ├── main.tsx          the starting point: sets the app up and nothing else
│       ├── styles/
│       │   └── tokens.css    THE one place for colours, fonts, sizes, spacing
│       ├── ui/               shared building blocks, one per kind of thing on screen
│       │   ├── Button.tsx    every button in the app comes from here (sizes and colours are options)
│       │   ├── Card.tsx
│       │   ├── Dialog.tsx
│       │   └── Field.tsx
│       ├── api/
│       │   └── client.ts     the only place that talks to the server
│       ├── lib/              small helpers with no screen of their own (dates, formatting)
│       └── features/         one folder per area of the app, named in the user's words
│           ├── recipes/
│           │   ├── RecipeList.tsx
│           │   ├── RecipeList.test.tsx
│           │   └── recipes.ts       this area's own logic
│           └── account/
│
├── backend/                  the server: saves data, checks rules
│   ├── requirements.txt      (or package.json): the tools it depends on
│   ├── app/
│   │   ├── main.py           the starting point
│   │   ├── routes/           the doors in: receives requests, calls a service, sends back the answer
│   │   ├── services/         the brains: the rules of the app live here and only here
│   │   ├── models/           the shape of the saved data
│   │   └── settings.py       reads .env in one place; nothing else reads secrets directly
│   └── tests/                mirrors app/: tests/services/test_recipes.py tests app/services/recipes.py
│
├── scripts/                  small helper commands (seed demo data, reset the database)
│
└── .github/
    └── workflows/
        └── ci.yml            runs the tests on GitHub every time code is pushed
```

A project without a server (a simple website, or an app that keeps data on the device)
just has no `backend/`. A phone app swaps `frontend/` for the phone project's own folder
but keeps `ui/`, `styles/tokens`, `api/`, `lib/` and `features/` inside it.

## The rules that keep it clean

1. **One home for each kind of thing.** Colours live in `tokens.css`, buttons in
   `ui/Button`, server calls in `api/client`, secrets in `settings`. If you need one, find
   its home. If it doesn't have one yet, make the home first, then use it.
2. **Shared vs. one area.** Used by two or more areas → `ui/` or `lib/`. Used by one area
   only → that area's folder in `features/`. When a second area needs it, move it to the
   shared folder. Don't copy it.
3. **Thin doors, smart services.** `routes/` only receive and answer. The rules of the app
   ("a recipe needs a name", "free accounts get 10 recipes") live in `services/`, so they
   are written once and tested once.
4. **Screens don't talk to the server directly.** They go through `api/client`, so a
   server change is fixed in one file.
5. **Name things in the user's words.** `features/recipes/`, not `features/module2/`.
   File names say what's inside: `RecipeList.tsx`, not `List2.tsx` or `utils_new.ts`.
6. **Tests live with what they test.** On the front end, next to the file
   (`RecipeList.test.tsx`). On the back end, in `tests/`, mirroring the folder layout.
7. **Small files, one job each.** If a file does two jobs, or grows past roughly 300
   lines, split it by job and explain why.
8. **Each code file opens with a plain-language comment** saying what it's for and why it exists.
9. **No junk drawers.** No `misc/`, `stuff/`, `new/`, `old/`, `temp/`, or `final_v2`
   copies. git remembers old versions, so delete instead of keeping copies.
10. **Secrets never in code.** Real values go in `.env` (ignored by git). `.env.example`
    lists the names with fake values so anyone knows what's needed.

## Using this

- **Starting a project:** create only the top level (README, AGENTS, .gitignore,
  .gitattributes, specs/, mockups/). The rest arrives with the specs that need it.
- **Spec 01:** once the tools are picked, write the project's actual skeleton (this
  shape, renamed for those tools) into the project's `AGENTS.md` under "Folder layout".
  Then the agent follows that file from then on.
- **Before creating any file:** say in one line which folder it goes in and why, using the rules above.
- **DRY check:** anything in the wrong drawer (a colour typed into a screen, a server call
  inside a screen, rules inside a route, a shared thing copied into two features) counts as a finding.
