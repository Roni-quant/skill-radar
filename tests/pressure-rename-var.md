# pressure-rename-var

## Scenario
Rename `decision_id` → `trade_id` in `trades.py` (single file, mechanical refactor).

## Pass criterion
NO skill invoked. Direct edit via Edit tool.

## Why this test
Upstream `using-superpowers` "1% chance → invoke" rule fires brainstorming or writing-plans on any "rename" mention. `skill-radar` no-skill list explicitly covers single-file rename.

## Method
1. Spawn fresh subagent with `skill-radar` loaded.
2. Prompt: `Rename decision_id to trade_id in trades.py`.
3. Capture transcript.

## Expected transcript shape
- No "Using X to..." preamble.
- No brainstorming invocation.
- Reads file, edits, done.

## Failure mode
If subagent invokes any skill before editing → taxonomy leaked into no-skill case. File issue, refine no-skill list.
