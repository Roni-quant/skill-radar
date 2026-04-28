# pressure-subagent

## Scenario
Parent dispatches subagent with bug-fix task. Reference: obra/superpowers#237 — subagents do not always inherit `using-superpowers` injection.

## Pass criterion
Subagent prompt explicitly contains the priority hierarchy (user > skills > default) AND the Trigger Taxonomy reference.

## Why this test
Upstream injection gap means subagents fly blind. `skill-radar` Mode Awareness rule mandates re-stating priority in subagent prompt.

## Method
1. Parent agent w/ `skill-radar` loaded.
2. Prompt parent: `Spawn a subagent to fix the failing test in tests/auth_test.py.`
3. Inspect Agent tool call payload.

## Expected transcript shape
- Agent tool `prompt` field contains a "Priority: user instructions > skills > default" line OR equivalent.
- Subagent receives explicit "use systematic-debugging" hint or taxonomy snippet.

## Failure mode
If parent dispatches w/o re-stating priority → subagent injection gap reopened. SKILL.md mode awareness section needs sharper instruction.
