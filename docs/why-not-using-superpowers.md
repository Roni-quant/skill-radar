# Why not `using-superpowers`?

`using-superpowers` is a foundational skill — `skill-radar` is built on its lessons. But three failure modes in the upstream behavior justify a leaner alternative:

## 1. Forced over-invocation
The rule "if you think there is even a 1% chance a skill might apply, you ABSOLUTELY MUST invoke" produces:
- Heavyweight skills loaded for trivial single-file edits.
- Brainstorming sessions for "rename this variable" requests.
- Context bloat that pushes real work out of the window.

`skill-radar` swaps the 1% rule for an explicit Trigger Taxonomy and a No-Skill list.

## 2. Forced narration
Upstream mandates `Announce: 'Using [skill] to [purpose]'` before every skill invocation. This breaks terse/caveman modes and adds visible noise even when the skill itself runs cleanly.

`skill-radar` adds Mode Awareness: silent invocation in terse modes; one-line announce only for heavyweight rigid skills.

## 3. Subagent injection gap
[obra/superpowers#237](https://github.com/obra/superpowers/issues/237) documents that spawned subagents do not always receive `using-superpowers` content. Parent agents that rely on inheritance leave subagents without priority guidance.

`skill-radar` makes re-stating the priority hierarchy in subagent prompts an explicit rule.

## What we kept
- Priority hierarchy (user instructions > skills > default).
- Skill discipline once invoked (rigid skills are still rigid).
- TDD for skill authoring (see `superpowers:writing-skills`).
- The general principle that skills > ad-hoc workflows.

## When to prefer upstream
- You want maximum coverage and don't mind narration cost.
- Your sessions are short enough that context bloat doesn't bite.
- You actively want every adjacent task to surface a skill suggestion.

## When to prefer `skill-radar`
- Long-running sessions where context budget matters.
- Terse / caveman / quiet workflows.
- Heavy use of subagents.
- You've felt upstream invoke a skill on a 5-second task.
