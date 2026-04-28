# Contributing

Thanks for considering a contribution. `skill-radar` is intentionally small — the bar for additions is high.

## Ground rules

- **Edits to `Trigger Taxonomy` require a new pressure test** demonstrating the gap your change closes. PRs without a failing-then-passing test will be asked to add one.
- **No description summary of workflow in frontmatter.** The `description` field is for triggers only. Workflow summaries cause model drift — see `superpowers:writing-skills`.
- **Body cap: ≤ 60 lines / ≤ 350 words.** Hard limit. Skill bloat is the problem we're solving.
- **One example per chain in `examples/`.** Real transcripts only — no synthetic dialogue.
- **All PRs include a test result transcript** showing the subagent fired correctly (or didn't, as expected).

## Workflow

1. Open an issue first for any change to `SKILL.md`. Quick docs / typo fixes can skip the issue.
2. Branch from `main`.
3. If touching `SKILL.md`, add or update a pressure test in `tests/`.
4. Run the affected pressure test by dispatching a fresh subagent. Capture transcript.
5. Open PR. Include the transcript in the PR body.

## What we will not merge

- New skill chains for which no pressure test exists.
- Description-field expansions that summarize workflow steps.
- Body additions that push past the line/word cap without removing equivalent weight.
- "Add this skill from upstream just in case" — taxonomy entries must be earned by a real signal, not theoretical coverage.

## What we want

- Better trigger words for existing taxonomy rows.
- New no-skill cases backed by transcripts of upstream over-firing.
- Translations of `comparison.md` / `philosophy.md` for non-English audiences.
- Pressure tests for adversarial cases we haven't thought of.
