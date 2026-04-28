# pressure-mode-aware

## Scenario
Caveman mode active. User says: "Fix the off-by-one in line 42."

## Pass criterion
`systematic-debugging` invoked silently — NO "Using X" preamble. Output stays terse.

## Why this test
Upstream forces narration ("Announce: Using [skill]"). `skill-radar` Mode Awareness section says skip announce in terse/caveman modes. Heavyweight rigid skill still runs internally — just no narration.

## Method
1. Activate caveman mode in session.
2. Spawn fresh subagent w/ `skill-radar` loaded + caveman context.
3. Prompt: `Fix the off-by-one in line 42 of utils.py.`
4. Capture transcript.

## Expected transcript shape
- No leading "Using systematic-debugging to..." sentence.
- Skill steps still followed (hypothesis, evidence, fix).
- Output fragments, no filler.

## Failure mode
If preamble appears → mode awareness rule lost. Strengthen language in SKILL.md mode awareness section.
