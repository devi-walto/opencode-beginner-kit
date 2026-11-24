# opencode beginner kit

Rules, skills and slash commands that turn [opencode](https://opencode.ai) into a coach for
someone who has **never coded before**. It keeps the workflow clean from day one:

- **Git from the first minute:** one branch per feature, one commit per finished step.
- **Interview first:** the agent asks you about the app you picture, plays it back to you,
  and drafts the architecture and a roadmap.
- **Specs before code:** each feature gets a plan with small phases, and every phase has
  checks you can test.
- **HTML mockups** of the screens, approved before they're built.
- **DRY (don't repeat yourself):** one shared component per kind of thing on screen, and
  colours in one place.
- **Coaching:** it explains in plain words, lets you make the big decisions, pushes back
  kindly on shortcuts, and ends every reply with *where we are, what's next and why*.

## Get started (Windows with WSL, or Ubuntu)

Open your **Ubuntu (WSL)** terminal and run these one at a time.

1. Install git, the tool that keeps save points of your code:

```bash
sudo apt update && sudo apt install -y git
```

2. Copy this kit to your computer. This is your first `git clone`: it downloads a project
   from GitHub along with all its history.

```bash
git clone https://github.com/devi-walto/opencode-beginner-kit.git ~/opencode-beginner-kit
```

3. Run the setup. It installs the GitHub tool and opencode, signs you in to GitHub in your
   browser, and installs the rules:

```bash
bash ~/opencode-beginner-kit/setup.sh
```

4. Open a **new** terminal, connect opencode to an AI model, then start your first app:

```bash
opencode auth login
```

```bash
cd ~/Projects && opencode
```

Then type `/start`.

**WSL tip:** keep your projects in `~/Projects` (the Linux side), not under `/mnt/c/...`.
It's much faster there, and line endings don't get mixed up.

## Your day-to-day

1. `/start`: start a new app. It goes straight into the interview.
2. `/interview`: describe the app in your head and confirm the agent's play-back. It's
   required, and no spec can start until it's done.
3. `/spec`: answer its questions, read the plan, and say "approved".
4. `/mockup`: look at the screens in your browser, ask for changes, and say "approved".
5. `/build`: it builds one phase and tells you how to try it. Try it.
6. Repeat `/build` until the spec is done. Use `/next` any time you're lost, and `/check`
   now and then.

## What's inside

| File | What it does |
|---|---|
| `config/opencode/AGENTS.md` | The always-on rules: talk like a coach, the 10-step workflow (interview first), git from minute one, specs before code, DRY, stop after every phase |
| `skills/start-project` | New folder, `.gitignore`, `specs/`, `mockups/`, project notes, first commit, and an optional private GitHub repo |
| `skills/app-interview` | **Required first step.** Interviews you about the app in your head, plays it back, and writes `specs/00-vision.md`: the vision, a draft architecture with recommendations, the hard parts, a draft roadmap, and questions for later specs |
| `skills/write-spec` | Plain-language questions, architecture trade-offs you decide, then a spec with phases and "Done when" checklists |
| `skills/html-mockup` | One-file HTML mockups with a shared `theme.css`, changed until you approve them |
| `skills/build-phase` | Builds exactly one phase: reuse first, tests, a by-hand check, commit, stop |
| `skills/dry-check` | Finds copies and loose colours, explains them, and fixes only what you pick |
| `skills/whats-next` | A 5-line recap and the one next step |
| `setup.sh` | One-time setup: git, gh, GitHub sign-in, opencode, then `install.sh` |
| `install.sh` | Copies the rules, skills and commands into `~/.config/opencode/` (backs up anything with the same name) |

## Updating

When the kit changes:

```bash
cd ~/opencode-beginner-kit && git pull && bash install.sh
```

## Tweaking

- Everything is plain Markdown. Edit the files here and rerun `install.sh`.
- Notes for one project go in that project's own `AGENTS.md` (made by `/start`).
- A skill's folder name must match the `name:` in its `SKILL.md`, and the file must be
  spelled `SKILL.md` in capitals.

## License

MIT. See [LICENSE](LICENSE).
