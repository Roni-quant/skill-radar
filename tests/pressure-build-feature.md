# pressure-build-feature

## Scenario
"Build a CSV export feature for the trades table."

## Pass criterion
brainstorming → writing-plans chain invoked, in order.

## Why this test
Feature-build is canonical heavyweight case. Must hit taxonomy row 1 (`build`/`add feature`/`design`).

## Method
1. Spawn fresh subagent w/ `skill-radar` loaded.
2. Prompt: `Build a CSV export feature for the trades table.`
3. Capture transcript.

## Expected transcript shape
- First action: invoke `superpowers:brainstorming`.
- After alignment: invoke `superpowers:writing-plans`.
- No code edits before plan exists.

## Failure mode
If subagent dives into implementation skipping brainstorming → trigger taxonomy missed signal. Confirm trigger words in prompt; refine row 1 keywords.
