# Example: bug fix (debugging chain invoked)

**Scenario:** bug report with concrete failure signal — taxonomy row 2 match.

---

**User:** The `/auth/login` endpoint is failing with 500 on valid credentials. It worked yesterday.

**Assistant** (with `skill-radar` loaded):

> Matched "failing" → invoking `superpowers:systematic-debugging`.

[systematic-debugging loads]

**Hypothesis 1:** recent commit changed token signing. Evidence: check `git log -- auth/`.

```bash
git log --oneline -5 -- auth/
```

→ commit `a3f8c2` "rotate JWT secret".

**Hypothesis 2:** secret rotation didn't update verifier env var. Evidence: read `.env.example` vs `.env`.

→ confirmed: `JWT_VERIFY_SECRET` missing from running config.

**Fix:** add the env var, restart service. Reproduces? No → bug confirmed cause.

> Invoking `superpowers:test-driven-development` for regression.

[TDD loads, writes failing test, then fix, then green]

---

## Why this transcript matters

- "failing" was the trigger — not "broken" or "bug" or "fix" — taxonomy is keyword-tolerant.
- Debugging skill ran a **structured hypothesis loop**, not a vibes-based dive.
- TDD chained automatically per Composition Chains (`debugging → TDD → fix → verification`).
- No brainstorming detour, no "let me first understand the architecture" — bug had a clear signal.
