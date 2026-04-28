# skill-radar

**Trigger-driven skill invocation for Claude Code. Fewer false positives, no forced narration, subagent-safe.**

> A lean alternative to `using-superpowers` — fire skills on signal, not on every keystroke.

[![Version](https://img.shields.io/badge/version-0.1.0-blue.svg)](https://github.com/Roni-quant/skill-radar/releases)
[![Claude Code plugin](https://img.shields.io/badge/Claude%20Code-plugin-8b5cf6.svg)](https://docs.claude.com/en/docs/claude-code)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/Roni-quant/skill-radar?style=social)](https://github.com/Roni-quant/skill-radar)
[![PRs welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

<p align="center">
  <img src="assets/demo.gif" alt="skill-radar demo: same rename prompt, upstream over-fires four skills, skill-radar edits direct" width="900">
</p>

## What you get

- **Explicit Trigger Taxonomy** — skills fire on real signals, not "1% chance → invoke."
- **No-skill list** — single-file edits, lookups, and trivial fixes stay direct.
- **Mode-aware announce** — silent in terse/caveman modes; one-line for heavyweight skills only.
- **Subagent priority injection** — re-states the user > skills > default hierarchy in dispatched prompts (closes [obra/superpowers#237](https://github.com/obra/superpowers/issues/237)).

## Why

- **Triage, not paranoia.** Upstream `using-superpowers` enforces "1% chance → invoke." That's a false-positive engine — see ["The Controllability Problem"](https://paddo.dev/blog/claude-skills-controllability-problem/) for the full case. `skill-radar` swaps it for an explicit Trigger Taxonomy.
- **Silent on noise.** Single-file edits, lookups, status checks: no skill, no narration, no preamble.
- **Mode-aware.** Terse / caveman / quiet workflows skip the forced `Announce: Using X` line.
- **Subagent-safe.** Re-states the priority hierarchy in dispatched prompts to close the [obra/superpowers#237](https://github.com/obra/superpowers/issues/237) injection gap.

## Install

### Plugin marketplace (recommended)
```bash
/plugin marketplace add Roni-quant/skill-radar
/plugin install skill-radar@skill-radar-marketplace
```

### Manual (Claude Code)
```bash
git clone https://github.com/Roni-quant/skill-radar ~/.claude/skills-src/skill-radar
ln -s ~/.claude/skills-src/skill-radar/skills/skill-radar ~/.claude/skills/skill-radar
```

> Codex / Gemini install paths are tracked for v0.2 — see [Roadmap](#roadmap).

## Try it

Once installed, send any of these to Claude Code and watch what `skill-radar` decides:

| You say | skill-radar does |
|---|---|
| `Build a CSV export feature for the trades table.` | Matches **"build"** → invokes `brainstorming` → `writing-plans`. |
| `Fix the off-by-one in line 42.` | Matches **"fix"** → invokes `systematic-debugging`. |
| `Rename decision_id to trade_id in trades.py.` | **No match** → direct edit. No skill, no narration. |

That's the whole product. Three lines of input → three different routing decisions, no over-firing, no forced preamble.

## How it works

Internally, every user message goes through this loop:

1. User sends a message.
2. `skill-radar` matches the message against its Trigger Taxonomy.
3. **Match** → invoke the indicated skill, then act.
4. **No match** → act direct. No skill load, no announcement.
5. If an invoked skill turns out to be a wrong fit mid-task → say so once, abort, continue direct.
6. Heavyweight rigid skills (TDD, debugging) get a one-line announce; everything else stays silent in terse modes.
7. Subagents inherit a re-stated priority hierarchy in their dispatch prompt.

For full transcripts of each routing decision in real sessions, see [Examples](#examples).

## Comparison

| Dimension | `using-superpowers` | `skill-radar` |
|---|---|---|
| Trigger rule | "1% chance → invoke" | Explicit taxonomy match |
| No-skill cases | Implicit / discouraged | Explicit list |
| Mode awareness | Forced narration | Respects terse/caveman |
| SKILL.md size | ~117 lines | ~50 lines |
| Subagent injection | Documented gap (#237) | Re-states priority |
| Description style | Workflow summary risk | Triggers only |

## Philosophy

- **Triage > paranoia.** Most messages don't need a workflow.
- **Skills earn invocation.** Loading a skill is a context cost.
- **Description bloat = drift.** Triggers in description; steps in body.
- **Subagents need explicit priority.** Re-state the hierarchy on dispatch.

Full discussion in [`docs/philosophy.md`](docs/philosophy.md).

## Examples

- [`examples/transcript-feature.md`](skills/skill-radar/examples/transcript-feature.md) — build chain.
- [`examples/transcript-bugfix.md`](skills/skill-radar/examples/transcript-bugfix.md) — debugging chain.
- [`examples/transcript-trivial.md`](skills/skill-radar/examples/transcript-trivial.md) — no-skill case.

## Compatibility

> **Coexistence:** `skill-radar` is a drop-in alternative to upstream `using-superpowers`, not a replacement that breaks it. Both can be installed simultaneously — pick one as the active triage layer in your global `CLAUDE.md`.

To prefer `skill-radar` globally, add to your `~/.claude/CLAUDE.md`:

```markdown
## Skill triage
Use `skill-radar` for skill invocation decisions. Do not invoke `using-superpowers` simultaneously.
```

## Roadmap

See [`ROADMAP.md`](ROADMAP.md) for v0.2, v0.3, v1.0 plans and out-of-scope notes.

## Support

Questions, bug reports, taxonomy gaps: [open an issue](https://github.com/Roni-quant/skill-radar/issues).

## Contributing

See [`CONTRIBUTING.md`](CONTRIBUTING.md). Short version: edits to `Trigger Taxonomy` require a new pressure test.

## Credits

- [obra/superpowers](https://github.com/obra/superpowers) — built the foundation we lean on.
- [obra/superpowers-marketplace](https://github.com/obra/superpowers-marketplace) — marketplace.json shape.
- [anthropics/skills](https://github.com/anthropics/skills) — single-repo plugin+marketplace pattern.
- [obra/superpowers#237](https://github.com/obra/superpowers/issues/237) — subagent injection gap.
- `superpowers:writing-skills` — description-drift fix, TDD-for-skills methodology.

## License

MIT — see [`LICENSE`](LICENSE).
