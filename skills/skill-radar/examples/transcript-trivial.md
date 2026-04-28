# Example: trivial task (no skill)

**Scenario:** mechanical rename in one file. No taxonomy match. No-skill list applies.

---

**User:** Rename `decision_id` to `trade_id` in `trades.py`.

**Assistant** (with `skill-radar` loaded):

[reads `trades.py`]

[edits `trades.py`, `replace_all: true` for `decision_id` → `trade_id`]

Done. 7 occurrences replaced.

---

## Why this transcript matters

- No skill invocation. Not brainstorming, not writing-plans, not TDD.
- No "Using X to..." preamble.
- No "let me first explore the codebase to understand the impact."
- Total turns: 1. Total skills loaded: 0. Total tokens spent on workflow narration: 0.

## What upstream `using-superpowers` would do here

Per the "1% chance → invoke" rule, upstream is liable to:

1. Trigger `superpowers:brainstorming` ("renames could be feature work, ask the user").
2. Trigger `superpowers:writing-plans` ("multi-step rename, write a plan first").
3. Announce: `Using brainstorming to clarify rename scope`.

Net cost: 2 skills loaded, 1 forced narration, 2+ turns of clarifying questions for a 7-character find-and-replace.

`skill-radar`'s no-skill list closes this loop: single-file mechanical refactor → direct edit, full stop.
