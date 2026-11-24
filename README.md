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

## Get started on Windows

Open **PowerShell** (Start menu → type "PowerShell") and run these one at a time.

1. Install git, the tool that keeps save points of your code:

```powershell
winget install --id Git.Git -e --source winget
```

Then **close PowerShell and open a new one**, so it can find git.

2. Copy this kit to your computer. This is your first `git clone`: it downloads a project
   from GitHub along with all its history.

```powershell
git clone https://github.com/devi-walto/opencode-beginner-kit.git "$HOME\opencode-beginner-kit"
```

3. Run the setup. It installs the GitHub tool, Node.js and opencode, signs you in to GitHub
   in your browser, installs the rules, and makes a `Projects` folder in your user folder:

```powershell
powershell -ExecutionPolicy Bypass -File "$HOME\opencode-beginner-kit\setup.ps1"
```

4. Open a **new** PowerShell, connect opencode to an AI model, then start your first app:

```powershell
opencode auth login
```

```powershell
cd "$HOME\Projects"
```

```powershell
opencode
```

Then type `/start`. You can tell the agent normal Windows paths
(`C:\Users\you\Projects\my-app`); it handles the rest.

No WSL needed. If a project ever needs Docker, the agent walks you through Docker Desktop at
that point.

## Or let opencode set it up for you

Already have opencode? Ask it: *"Set yourself up using the 'Setup steps for the agent'
section of https://github.com/devi-walto/opencode-beginner-kit"*.

### Setup steps for the agent

You (the agent) are setting this kit up for a beginner. Explain each step in one plain
sentence. Don't run anything that waits for typed input, because it would hang.

1. Work out the system. On Windows, use PowerShell commands.
2. If git or gh is missing, install them: `winget install --id Git.Git -e --source winget`
   and `winget install --id GitHub.cli -e --source winget` (accept the agreements with
   `--accept-package-agreements --accept-source-agreements`). Then refresh PATH in your
   shell: `$env:Path = [Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [Environment]::GetEnvironmentVariable("Path","User")`.
3. Clone this repo to `$HOME\opencode-beginner-kit` (Mac/Linux: `~/opencode-beginner-kit`).
   Tell them this is their first `git clone` and what it means.
4. Ask for their name and the email on their GitHub account (or GitHub's private no-reply
   email). Then set `git config --global user.name`, `user.email` and
   `init.defaultBranch main`.
5. Run the installer: `powershell -ExecutionPolicy Bypass -File "$HOME\opencode-beginner-kit\install.ps1"`
   (Mac/Linux: `bash ~/opencode-beginner-kit/install.sh`).
6. Create `$HOME\Projects` (not inside Documents or OneDrive).
7. GitHub sign-in needs a browser and a code, so they do it themselves. Tell them to open a
   separate PowerShell window and run `gh auth login` (choose GitHub.com → HTTPS → Yes →
   Login with a web browser), then `gh auth setup-git`.
8. Tell them to close opencode, open it again in their `Projects` folder, and type `/start`.

## Get started on Mac or Linux

Install git (Mac: `xcode-select --install`; Ubuntu: `sudo apt install -y git`), then:

```bash
git clone https://github.com/devi-walto/opencode-beginner-kit.git ~/opencode-beginner-kit
```

```bash
bash ~/opencode-beginner-kit/setup.sh
```

`setup.sh` uses apt, so it covers Ubuntu, Debian and WSL. On a Mac, install `gh` and
opencode yourself (for example with Homebrew), then run `bash install.sh`.

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
| `config/opencode/AGENTS.md` | The always-on rules: Windows-friendly, talk like a coach, the 10-step workflow (interview first), git from minute one, specs before code, DRY, stop after every phase, Docker only when needed |
| `skills/start-project` | New folder, `.gitignore`, `specs/`, `mockups/`, project notes, first commit, and an optional private GitHub repo |
| `skills/app-interview` | **Required first step.** Interviews you about the app in your head, plays it back, and writes `specs/00-vision.md`: the vision, a draft architecture with recommendations, the hard parts, a draft roadmap, and questions for later specs |
| `skills/write-spec` | Plain-language questions, architecture trade-offs you decide, then a spec with phases and "Done when" checklists |
| `skills/html-mockup` | One-file HTML mockups with a shared `theme.css`, changed until you approve them |
| `skills/build-phase` | Builds exactly one phase: reuse first, tests, a by-hand check, commit, stop |
| `skills/dry-check` | Finds copies and loose colours, explains them, and fixes only what you pick |
| `skills/whats-next` | A 5-line recap and the one next step |
| `skills/project-structure` | The picture of a clean project: the general skeleton, what goes in each folder, and 10 rules (one home per thing, thin routes and smart services, no junk drawers...) |
| `setup.ps1` / `setup.sh` | One-time setup (Windows / Ubuntu): git, gh, GitHub sign-in, opencode, then the installer |
| `install.ps1` / `install.sh` | Copies the rules, skills and commands into `~/.config/opencode/` (backs up anything with the same name) |

## Updating

When the kit changes:

Windows:

```powershell
cd "$HOME\opencode-beginner-kit"
```

```powershell
git pull
```

```powershell
powershell -ExecutionPolicy Bypass -File install.ps1
```

Mac/Linux: `cd ~/opencode-beginner-kit && git pull && bash install.sh`

## Tweaking

- Everything is plain Markdown. Edit the files here and rerun the installer.
- Notes for one project go in that project's own `AGENTS.md` (made by `/start`).
- A skill's folder name must match the `name:` in its `SKILL.md`, and the file must be
  spelled `SKILL.md` in capitals.

## License

MIT. See [LICENSE](LICENSE).
