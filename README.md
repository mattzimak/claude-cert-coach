# Cert Coach

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE) ![Plugin 0.1.0](https://img.shields.io/badge/plugin-0.1.0-black) ![Foundations ready](https://img.shields.io/badge/Foundations-ready-2ea043) ![Professional after 17 Nov 2026](https://img.shields.io/badge/Professional-after%2017%20Nov%202026-lightgrey)

A Claude Code plugin for preparing for Anthropic's **Claude Certified Architect** exams. It packages the method I used to pass Foundations as a non-developer: 667 the first time, 851 the second.

It does four things:

- walks you through registration, with your own deadlines worked out,
- teaches how to read a scenario question, which is where my first attempt failed,
- drills you with fresh practice questions it writes for you from the public exam guide, and saves every miss as a one-line rule,
- explains any concept or miss in plain words, anchored to the official guide.

It is written for people who do not write code every day, and it works fine if you do.

The full story, the reading habits and the exam-day rules are in my free guide: [How I passed the Claude Certified Architect exam as a non-developer](https://agentmatik.ai/guides/how-i-passed-the-claude-certified-architect-exam-as-a-non-developer).

## Install

In Claude Code:

```
/plugin marketplace add mattzimak/claude-cert-coach
/plugin install cert-coach@mattzimak-cert
```

Then start with:

```
/cert-coach:foundations
```

From a terminal instead of a session: `claude plugin marketplace add mattzimak/claude-cert-coach`, then `claude plugin install cert-coach@mattzimak-cert`, then start Claude Code (or run `/reload-plugins` in a session that is already open). If the short `owner/repo` form fails for you, add the marketplace by its full URL: `https://github.com/mattzimak/claude-cert-coach.git`.

**One recommended step:** download the official exam guide (links below) and save it as `cert-notes/exam-guide.pdf` in the folder where you run Claude Code. Every skill reads it from there and anchors its answers to the guide's exact wording. Without it the plugin still works, from its own index of the guide.

## The skills

| Skill | What it does | Try |
|---|---|---|
| `foundations` | Start here. Exam format, the five domains and weights, the 30 task statements in plain words, a study plan sized to the days you have. | `/cert-coach:foundations 7 first attempt` |
| `register` | Registration 101 as a checklist: partner email, payment, the two Pearson emails, scheduling, the 48-hour change window, ID name match, retake waits. Works out your own deadlines. | `/cert-coach:register foundations 2026-11-20 14:00 Europe/Prague` |
| `method` | The seven reading habits, the conventions to know word for word, and the one-line format for a mistakes log. | `/cert-coach:method habits` |
| `drill` | Practice: writes original scenario questions one at a time, grades them, explains every option, serves a "flip one constraint" twin after a miss, logs misses to `cert-notes/rules.md`. | `/cert-coach:drill 10 4.3` |
| `tutor` | Explains a concept, a task statement or your last miss in plain words, with an everyday analogy, then checks you with one question. | `/cert-coach:tutor tool_choice` |
| `professional` | The Professional track, honest about its state (see below). Points to the official page and runs drill and tutor against the guide you supply. | `/cert-coach:professional 2026-12-15` |

You can also just talk: "quiz me on structured output", "explain my last miss", "how do I reschedule". Claude picks the right skill.

## Your notes stay yours

The plugin writes only to a `cert-notes/` folder in the directory where you run Claude Code:

- `cert-notes/rules.md` - one line per mistake: *When X, the answer is Y, not Z.* Edit it freely; your own words stick better. Read it on exam morning.
- `cert-notes/drill-log.md` - one row per practice session, which `/cert-coach:drill weak` uses to find your weak spots.

Nothing is sent anywhere. Delete the folder whenever you like.

## How the practice questions are made

Every question is generated fresh, for you, from the task statements in Anthropic's public exam guide. The drill skill is told to:

- put one deciding fact in each question (a number, a "must", team-wide versus personal, blocking versus overnight),
- make every wrong option right under some other constraint, and tell you which,
- after a miss, ask the same question with one constraint flipped, so you learn where the answer changes,
- include multiple-response items ("Select TWO") where the guide's format allows them,
- follow the guide where it differs from today's docs, and say so.

Five worked examples, all original, are in [reference/example-items.md](reference/example-items.md).

## What this plugin will never contain, and why

- **No real exam questions or exam content.** Anthropic's Certification Exam Policy forbids distributing, copying, publishing or posting exam questions, answers or other exam content, and every candidate accepts a non-disclosure agreement. Using leaked questions counts as misconduct and can cost you the certification. The skills refuse recalled exam questions, even if you offer them.
- **No copied question banks.** No community, commercial or private banks are bundled or paraphrased. Every item is written fresh from the public guide.
- **No third-party course material.** Nothing from any paid or free course or study site is copied in. The study site I used and the reading order are in the subscriber bonus of [the guide](https://agentmatik.ai/guides/how-i-passed-the-claude-certified-architect-exam-as-a-non-developer).
- **No copy of the exam guide PDF.** The plugin links to Anthropic's official copy, so you always get the current version.
- **No personal data.** No names, scores or study groups of anyone.

## Status

- **Foundations (CCAR-F):** ready. Built against the public Foundations exam guide, version 1.0 (July 2026).
- **Professional (CCAR-P):** the exam's content changes on 7 December 2026, and Anthropic publishes the new guide on 17 November 2026. The full Professional track comes after that. Until then, `/cert-coach:professional` gives the official links and runs the drill and tutor against whichever guide you supply.

Facts about registration, prices and policies are dated October 2026. Programs change; check the [official certification FAQ](https://anthropic-partners.skilljar.com/page/faq-certifications) before relying on a date or a price.

## Official sources

- Foundations exam page: https://anthropic-partners.skilljar.com/claude-certified-architect-foundations-certification
- Foundations exam guide (PDF): [Claude Certified Architect - Foundations Exam Guide](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F6nizmqk8tpzpfjvt6qmmav7rh%2Fpublic%2F1783542750%2FClaude+Certified+Architect+%E2%80%93+Foundations+Exam+Guide.pdf)
- Professional exam page: https://anthropic-partners.skilljar.com/claude-certified-architect-professional-certification
- All certifications, guides and policies: https://anthropic-partners.skilljar.com/page/partner-certifications
- Certification FAQ: https://anthropic-partners.skilljar.com/page/faq-certifications

## About

Built by [Matt Zimak](https://mattzimak.com). I run an automation agency, I do not write code for a living, and I passed Claude Certified Architect - Foundations with 851 on 30 September 2026. I sit the Professional exam next, and its track here will be built from the new guide once Anthropic publishes it.

Not affiliated with or endorsed by Anthropic. Claude is a trademark of Anthropic.

Issues and pull requests welcome. Contributions follow the same rules as the plugin: original material only, no exam content, no copied questions.

[MIT License](LICENSE)
