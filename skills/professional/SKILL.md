---
name: professional
description: The Claude Certified Architect - Professional exam (CCAR-P) track, honest about its state. The Professional exam content changes on 7 December 2026 and the new exam guide is published on 17 November 2026, so this plugin's full Professional track comes after that date. Until then it gives the official links, the facts that do not depend on the guide, and runs the drill and tutor against whatever exam guide the user supplies. Use when someone mentions "CCAR-P", "Professional exam", "Architect Professional", or asks what the Professional exam covers.
argument-hint: "[exam date, e.g. 2026-12-15]"
---

# Claude Certified Architect - Professional

Arguments: `$ARGUMENTS`

## The state of this track (say this first, plainly)

- On **7 December 2026** the Professional exam switches to updated content. Anthropic publishes the updated exam guide on **17 November 2026**.
- This plugin's Professional track (a blueprint index and tuned drills, like the Foundations one) is **coming after 17 November 2026**, once the new guide is public. Until then the plugin does not ship a Professional blueprint, because one written from the current guide would be wrong for anyone testing on or after 7 December.
- What works today: `/cert-coach:drill professional` and `/cert-coach:tutor` run against **the guide you supply**, and `/cert-coach:register` and `/cert-coach:method` apply unchanged.

Official page (guide, terms, policy, registration): https://anthropic-partners.skilljar.com/claude-certified-architect-professional-certification
All certifications and their current guides: https://anthropic-partners.skilljar.com/page/partner-certifications

## Step 1 - which guide

Ask for the exam date if `$ARGUMENTS` does not give one.

- **Exam before 7 December 2026:** use the guide currently on the official page (version 1.0, effective July 2026).
- **Exam on or after 7 December 2026:** use the guide published on 17 November 2026. If today is before that date, say they should wait for it, and that study before then should stay on skills that carry over (the reading method, the conventions, hands-on building).

Ask the user to download the right guide and save it as `./cert-notes/exam-guide-professional.pdf`, or attach it. Read it when it is there.

## Step 2 - facts that do not depend on the guide version

- Registration, partner email, Pearson, the 48-hour change window, the name match, retake waits (14, 30, 90 days) and four attempts per rolling 12 months: see `/cert-coach:register`.
- Fee $175 USD before partner discount.
- No prerequisite: you can sit Professional without holding Foundations, and Foundations does not convert into Professional.
- Pass mark is a scaled 720 on a 100 to 1,000 scale for all four Claude certifications (per the FAQ).

For anything else (number of items, domains, weights, objectives), read it from the guide the user supplied and say which version it is. Do not quote these from memory: they are exactly what may change on 7 December.

## Step 3 - study with the supplied guide

1. Read the guide's blueprint section. List its domains, weights and objectives back to the user in a short table, with the guide's version and effective date, and ask them to confirm it is the guide for their exam date.
2. Build a plan the same way `/cert-coach:foundations` does: heaviest and weakest domains first, a daily drill, one-line rules for every miss, the last day for rules only.
3. Drill with `/cert-coach:drill professional <count>`; teach with `/cert-coach:tutor`. Both follow the same rules as Foundations: original questions only, the guide is the answer key, no real exam content ever.

Matt Zimak, who built this plugin, sits the Professional exam next. The track will be built from the new guide, not from anyone's memory of an exam.
