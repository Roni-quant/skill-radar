# Example: feature build (chain invoked)

**Scenario:** new feature request, taxonomy row 1 match.

---

**User:** Build a CSV export feature for the trades table.

**Assistant** (with `skill-radar` loaded):

> Matched "build" → invoking `superpowers:brainstorming`.

[brainstorming skill loads — clarifying questions]

- Scope: which columns? all 18, or a subset?
- Format: RFC 4180 CSV, or Excel-flavored (BOM, CRLF)?
- Delivery: download, S3, both?
- Trigger: user button, scheduled, both?

[user answers]

> Alignment reached. Invoking `superpowers:writing-plans`.

[writing-plans skill loads — produces `plan.md` with steps, files-touched, tests]

> Plan written. Awaiting review before `executing-plans`.

---

## Why this transcript matters

- Single trigger word (`build`) routed straight to the heavyweight chain.
- No code edits before the plan exists.
- No mid-stream "let me also check..." rationalizations — taxonomy decided once, model executed.
- Skill announcement is **one line** per skill, not a paragraph.
