---
name: skill-radar
description: Use when starting any conversation, before any skill invocation or response. Especially when tempted to invoke a skill for trivial tasks like single-file edits, lookups, or status checks.
---

# skill-radar

Lean, signal-driven skill triage. Fires on real triggers, stays silent on noise.

Supersedes upstream `using-superpowers`. Priority unchanged: user instructions > skills > default system prompt.

## Decision Rule
1. Match user message against Trigger Taxonomy.
2. Match → invoke skill, then act.
3. No match → act direct, no skill, no announcement.
4. Skill mid-task wrong-fits → say so once, abort skill, continue task.

## Trigger Taxonomy
| User signal | Skill |
|---|---|
| "build", "add feature", "design" | brainstorming → writing-plans |
| "fix", "broken", "failing", "bug" | systematic-debugging → TDD |
| "refactor large area", "redesign" | writing-plans |
| "review", "check code", "PR" | code-review:code-review |
| "done", "ship", "merge ready" | verification-before-completion → requesting-code-review |
| "write/edit skill" | superpowers:writing-skills |
| "create plan", "spec out" | superpowers:writing-plans |

## No-Skill Cases (act direct)
- Single-file edit, single-grep, single-command
- Factual questions, lookups, status checks
- Conversational replies, clarifications
- Small refactors (rename, extract in one file)
- Simple bug fixes with obvious cause

## Mode Awareness
- Terse / caveman / no-narration modes: skip "Announce: Using X" entirely.
- Heavyweight rigid skills (TDD, debugging): one-line announce OK.
- Subagents: re-state priority hierarchy in subagent prompt — upstream injection gap (obra/superpowers#237) means subagents may not see this.

## Composition Chains
- Feature: brainstorming → writing-plans → executing-plans → verification → requesting-code-review.
- Bug: systematic-debugging → TDD → fix → verification.
- Skill author: writing-skills RED → GREEN → REFACTOR.

## Stop Conditions
- User says "stop using skills" / "just do it" → respect, no skill that turn.
- Skill body wrong-fits → abort skill, continue task.

## Rationalization Table
| Excuse | Reality |
|---|---|
| "1% chance might apply" | False-positive engine. Match taxonomy or skip. |
| "Be safe, invoke anyway" | Burns context. Trust taxonomy. |
| "User didn't say it but probably wants TDD" | Taxonomy would match if they did. Don't impose. |
| "I'll summarize workflow in description for clarity" | Causes drift — model follows summary, skips body. Triggers-only. |

## Example triggers
- "fix this bug" → systematic-debugging
- "rename `foo` in user.py" → no skill
- "build new export feature" → brainstorming → writing-plans
