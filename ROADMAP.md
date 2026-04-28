# Roadmap

| Version | Status | Scope |
|---|---|---|
| **v0.1** | shipped | Core skill, 5 pressure tests, plugin/marketplace manifests, docs. |
| **v0.2** | planned | `scripts/analyze-transcripts.py` — scans `~/.claude/projects/*/transcripts` for skill-fire events, reports taxonomy hits/misses. Codex + Gemini install paths verified. |
| **v0.3** | planned | `skill-radar-debug` companion skill — when active, prepends every invocation with a one-line trace `[skill-radar: matched <signal> → <skill>]`. |
| **v1.0** | planned | Anthropic plugin marketplace submission. Stability commitment for `Trigger Taxonomy` keys. |

## How priorities are picked

- **v0.2 telemetry first** — taxonomy claims need data. Real-session transcripts > synthetic pressure tests.
- **v0.3 debug surface second** — once telemetry exists, a per-fire trace makes drift visible during normal use.
- **v1.0 last** — marketplace submission is gated on telemetry showing the no-skill list holds and trigger taxonomy generalizes beyond author transcripts.

## Out of scope (won't do)

- Multi-agent orchestration — `skill-radar` decides *which* skill, not *which agents*.
- A web UI — terminal-first, log-first, code-first.
- Auto-updating taxonomy — taxonomy entries are earned by pressure tests, not learned.
