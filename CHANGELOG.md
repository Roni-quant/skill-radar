# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- `ROADMAP.md` — extracted from README with v0.2/v0.3/v1.0 plans plus out-of-scope notes.
- README "Support" section linking to issues.
- README "Coexistence" callout in Compatibility section.

### Changed
- README: inlined paddo.dev "Controllability Problem" reference into Why; removed duplicate Credits entry.
- README: replaced inline mini-examples with cross-link to Examples section.
- README comparison table: renamed "Body length" → "SKILL.md size" for clearer signal.
- README: replaced inline Roadmap section with link to `ROADMAP.md`.

## [0.1.0] - 2026-04-28

### Added
- Initial `skill-radar` skill (`skills/skill-radar/SKILL.md`).
- Plugin manifest (`.claude-plugin/plugin.json`) and marketplace manifest (`.claude-plugin/marketplace.json`).
- 5 pressure tests in `tests/` covering rename-var, build-feature, mode-aware, subagent-injection, and grind-abort scenarios.
- Docs: `comparison.md`, `philosophy.md`, `why-not-using-superpowers.md`.
- 3 example transcripts in `skills/skill-radar/examples/`.
- MIT license, README, CONTRIBUTING, CLAUDE.md.
