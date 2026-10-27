# Changelog

All notable changes to this plugin. Format: [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). Versions follow [Semantic Versioning](https://semver.org/). The version lives in two places, `.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json`; bump both, or existing installs will not see the update.

## [Unreleased]

### Planned
- Professional (CCAR-P) blueprint index and tuned drills, built from the exam guide Anthropic publishes on 17 November 2026 for exams from 7 December 2026.

## [0.1.0] - 2026-10-27

### Added
- `foundations` skill: CCAR-F format, domains and weights, study plan by days available and first attempt or retake.
- `register` skill: registration checklist as of October 2026 (partner email, discounts, Pearson VUE emails, 48-hour change window, ID name match, retake waits 14/30/90 days, four attempts per rolling 12 months), with personal deadlines computed from the exam date.
- `method` skill: seven question-reading habits, conventions to know word for word with task statement ids, and the one-line-rule format for a mistakes log.
- `drill` skill: generates original practice items from the public exam guide's task statements, one at a time, with a deciding fact, distractors that win under a changed constraint, a flip-one-constraint twin after each miss, multiple-response items, and logging to `./cert-notes/`.
- `tutor` skill: plain-language explanations anchored to the official guide, with everyday analogies, "Exam key / Current reality" labels, and a one-question check.
- `professional` skill: honest state of the CCAR-P track and a supply-your-own-guide mode for drill and tutor.
- `reference/`: Foundations blueprint index (task ids, guide titles, plain-word summaries), exam key versus current docs table, vocabulary list, five original example items with rationales.
