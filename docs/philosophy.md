# Philosophy

Four principles behind `skill-radar`:

## 1. Triage > paranoia
The "1% chance → invoke" rule is a false-positive engine. Most user messages do not need a heavyweight workflow. Default to direct action; reach for skills only when the signal is unambiguous.

## 2. Skills earn invocation
A skill is a context cost. Loading it must produce more value than the tokens it burns. Single-file edits, lookups, and clarifications fail that test by definition.

## 3. Description bloat = drift
When a frontmatter `description` summarizes the workflow, the model follows the summary and skips the body. Restrict descriptions to triggers — the body holds the steps.

## 4. Subagents need explicit priority
Spawned subagents may not inherit the parent session's skill injection (see [obra/superpowers#237](https://github.com/obra/superpowers/issues/237)). Re-state the priority hierarchy (user > skills > default) in the dispatch prompt.
