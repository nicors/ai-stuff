# AI Stuff

Personal library for AI documentation, prompts, and reusable agent skills.

## Structure

- `docs/` — notes, references, and guides.
- `prompts/` — reusable prompts that are not full skills.
- `skills/<skill-name>/SKILL.md` — one directory per Codex skill; supporting material can live beside `SKILL.md` in `references/`, `scripts/`, or `assets/`.
- `templates/skill-template/` — starter file for new skills.
- `scripts/` — small utilities for managing this library.

Keep each skill self-contained. Its `SKILL.md` starts with YAML front matter containing `name` and `description`, followed by the instructions. The description should explain both what the skill does and when to use it.

## Install skills for Codex

From this repository, run:

```bash
./scripts/install-codex-skills.sh
```

The script creates symlinks for each `skills/*/` directory containing a `SKILL.md` under `$CODEX_HOME/skills/`, or `$HOME/.codex/skills/` when `CODEX_HOME` is not set. Existing files or directories with the same skill name are left untouched and reported, so the script can be run again safely.

After cloning this repository on another machine, run the same command to make its skills available there. Changes to a linked skill in this repository are reflected in the installed copy.

## Add a skill

1. Copy `templates/skill-template/SKILL.md` into a new directory under `skills/`.
2. Use a lowercase, hyphen-separated directory and matching `name` in the front matter.
3. Write a focused description that says what the skill does and when it should activate.
4. Add optional supporting files under that skill's `references/`, `scripts/`, or `assets/` directories.
5. Run the installer again.

## Current skills

- `scope-refiner` — turns selected and prioritized product or engineering ideas into a bounded Scope Brief.

## GitHub

Initialize or keep this folder as a Git repository, then add your GitHub remote and push using your usual Git workflow. Decide whether the repository should be public or private before publishing; review documents for personal or confidential information first.
