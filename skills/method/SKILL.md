---
name: method
description: Teaches the question-reading method for the Claude Certified Architect exams - last line first, read the scenario once, find the one deciding fact, "must/always" means an enforced mechanism not a prompt, prefer the team-wide answer, distrust the bigger option, two minutes a question - plus the conventions worth knowing word for word and the one-line-rule format for a mistakes log. Use when someone asks "how do I read these questions", "exam technique", "I keep picking the almost-right answer", "what should I memorise", "how do I keep a mistakes log", or "I run out of time".
argument-hint: "[habits | conventions | rules-log | all]"
allowed-tools: Bash(${CLAUDE_PLUGIN_ROOT}/scripts/ref.sh *)
---

# The method

Arguments: `$ARGUMENTS` (default: `all`)

This is the method Matt Zimak used to go from 667 to 851 on the Foundations exam as a non-developer. His first attempt failed on reading, not on knowledge: two options often look almost the same and differ by one technical detail. Teach it in plain words. If the user asks for one part, give only that part.

Ground conventions in the official exam guide (the link is in `/cert-coach:foundations`). Where the guide and today's docs differ, teach the guide's version, using the table below.

!`${CLAUDE_PLUGIN_ROOT}/scripts/ref.sh key`

## Part 1 - seven reading habits

1. **Read the last line first.** What is being asked, and how many answers to select. Then read the scenario.
2. **Read the scenario once, carefully.** Several questions hang off the same scenario; reuse that one reading instead of starting over each time.
3. **Find the one deciding fact.** Every well-written item has one: a number, a "must", "team-wide", "blocking", a log line, "first step". If you can answer without using it, you are pattern-matching and will fall for the near-twin option.
4. **"Must", "always", "guarantee", "every run" = enforce it.** When a rule has to hold every time, the answer is a mechanism the system enforces (a hook, a permission rule, a schema, a programmatic gate), not a better-worded prompt and not a line in CLAUDE.md. CLAUDE.md and prompts are advice the model usually follows; hooks and settings are rules it cannot skip. The exam guide states it directly for compliance-critical steps: prompt instructions alone have a non-zero failure rate.
5. **Prefer the team-wide answer.** Shared configuration committed to the repository, a check in the pipeline, a separate review session. One person's local workaround is usually the distractor, unless the stem says it is one person's experiment.
6. **Distrust the bigger option.** "Read everything first", a bigger model, a bigger context window, more agents, a new classifier: these are the standing distractors. The guide's own explanations favour the proportionate first fix that addresses the root cause.
7. **Two minutes a question.** 120 minutes for 60 items is two minutes each. If an item passes three minutes, make your best pick and move on. Answer every item: a blank cannot score.

**Flip one constraint.** After any practice item, ask: which single word in the stem, if changed, would make another option right? If you cannot say, you have not found the deciding fact. `/cert-coach:drill` does this for you on every miss.

## Part 2 - conventions to know cold

Most items are judgement, but a few conventions decide between two otherwise equal options. These come from the public exam guide's task statements; know them word for word.

- **Agent loop** (1.1): continue while stop_reason is "tool_use", stop on "end_turn". Read the signal from the response, never from the wording of the text, and never use an iteration cap as the main stopping rule.
- **tool_choice** (2.3, 4.3): "auto" lets the model answer in prose; "any" forces some tool call; `{"type": "tool", "name": "..."}` forces one named tool.
- **Message Batches API** (4.5): about half price, up to 24 hours, no latency guarantee, no tool calls in the middle of a request, custom_id to match results. For overnight or weekly work, never for a check someone is waiting on.
- **Hooks** (1.5): a hook before a tool call can block it (a refund over the limit, a forbidden command); a hook after a tool call can clean up or check the result. Formatting, linting and tests after an edit belong after the call, with failures fed back so the model fixes them.
- **CLAUDE.md** (3.1): files at different levels add up; they do not replace each other. The one in your home folder is yours alone and never reaches the team. /memory shows what loaded.
- **MCP config** (2.4): secrets stay out of the file as environment variables such as `${TOKEN}`, and the shared, team-wide server list is `.mcp.json` in the repository. Personal servers live in the user-level config.
- **Skills** (3.2): folders with a `SKILL.md`, loaded on demand. Frontmatter options the guide names: `context: fork`, `allowed-tools`, `argument-hint`. The guide treats `allowed-tools` as a restriction (see exam key versus reality).
- **Path rules** (3.3): `.claude/rules/` files with a `paths` glob load only for matching files, best for conventions spread across folders.
- **CI flags** (3.6): `claude -p` runs with no human; `--output-format json` with `--json-schema` makes findings machine-readable; CLAUDE.md carries the project's standards into CI.
- **Built-in tools** (2.5): Glob finds files by name, Grep searches inside files, Read opens one file, Edit needs a unique anchor (fall back to Read then Write). Discover step by step; do not read everything first.
- **Subagents** (1.2, 1.3): a subagent starts with an empty memory. The coordinator hands over what it needs in the prompt, and subagents never talk to each other directly.
- **Structured output** (4.3, 4.4): a schema guarantees shape, not truth. Fields the source may lack are optional or nullable. Retry with the error fed back fixes format, never missing information.
- **Escalation** (5.2): escalate when the customer asks for a person, when policy is silent or ambiguous, or when there is no progress. Not on sentiment, not on self-rated confidence.

## Part 3 - the mistakes log (one line per rule)

Keep a file you own, `./cert-notes/rules.md`, in the folder where you run Claude Code. One line per mistake, in your own words, in this shape:

```
- When <the deciding fact in the question>, the answer is <the right pattern>, not <the trap that caught me>. (task <id>, <YYYY-MM-DD>)
```

Examples of the shape (original, not from any exam):

```
- When a rule must hold on every run, the answer is a hook or a gate, not a sentence in the prompt. (task 1.4, 2026-10-01)
- When the files are found by their name, the answer is Glob, not Grep. (task 2.5, 2026-10-01)
- When a field may be missing from the document, the answer is a nullable field, not a retry. (task 4.3, 2026-10-02)
```

Rules for the log:

- Write only the mistakes, not everything you learned. A short file gets reread; a long one does not.
- Your own words beat copied ones. If a rule reads like the textbook, rewrite it the way you would say it to a colleague.
- Put it somewhere you can read on your phone.
- Read it the morning of the exam, then nothing new.

If the user asks you to add a rule, append it to `./cert-notes/rules.md` (create the folder and file if missing, and say so). Never overwrite the file.
