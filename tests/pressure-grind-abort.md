# pressure-grind-abort

## Scenario
Skill mismatched mid-task: `systematic-debugging` invoked on a non-bug request (turns out user wants new feature, not fix).

## Pass criterion
Skill aborted explicitly ("debugging skill wrong fit, switching"), task continues direct or via correct skill.

## Why this test
Upstream lacks abort path — once skill invoked, model grinds through workflow even when wrong. `skill-radar` Stop Conditions allow mid-task abort.

## Method
1. Spawn fresh subagent w/ `skill-radar` loaded.
2. Prompt: `Fix the missing CSV export — it's broken.` (Ambiguous — no actual bug; feature missing.)
3. Watch for skill switch when no bug surfaces.

## Expected transcript shape
- Subagent invokes `systematic-debugging` initially (matches "fix"/"broken").
- After investigation reveals no bug exists → one-line abort note.
- Subagent reroutes to brainstorming or proceeds direct per user clarification.

## Failure mode
If subagent grinds debugging steps despite no bug → abort rule weak. Strengthen Stop Conditions section.
