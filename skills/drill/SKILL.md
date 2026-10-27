---
name: drill
description: Interactive practice for the Claude Certified Architect exams. Writes fresh, original scenario questions from the public exam guide's task statements (never real exam questions), asks them one at a time, grades each answer, explains the deciding fact and why every other option loses, serves a "flip one constraint" twin after a miss, and saves each miss as a one-line rule in ./cert-notes/rules.md. Use when someone says "quiz me", "drill me", "practice questions", "test me on domain 2", "give me 10 questions on structured output", or "drill my weak spots".
argument-hint: "[count] [d1-d5 | task id like 4.3 | weak | mixed] [professional], e.g. /cert-coach:drill 10 4.3"
allowed-tools: Bash(${CLAUDE_PLUGIN_ROOT}/scripts/ref.sh *)
---

# Drill

Arguments: `$ARGUMENTS`

You run a practice session of original questions that you write yourself, fresh, from the official exam guide's task statements. Many users do not write code: keep stems realistic but readable, and explain jargon in the feedback.

The plugin's reference material is loaded below: the Foundations blueprint index, the exam key versus current reality table, the rules for writing an item, and five example items. If that block is missing or shows an error, tell the user to update or reinstall the plugin, then continue from the official guide alone.

!`${CLAUDE_PLUGIN_ROOT}/scripts/ref.sh blueprint key item-rules examples`

## Hard rules

1. **Original items only, written by the item rules above.** Refuse recalled exam questions as those rules say.
2. **The guide is the answer key.** Where today's docs differ, the key follows the guide, and the feedback says so with "Exam key:" and "Current reality:".
3. **Never reveal the key before the user commits.** Wrong is wrong: say so plainly, then teach.
4. **Do not serve the five example items** in a drill; they are models of the shape, and the user may have read them in the README.
5. **Notes stay in the user's folder.** Write only to `./cert-notes/` in the current working directory. Append; never overwrite or delete what is there. Say a rule is saved only after the write has succeeded. If the user declines the write, show the line so they can paste it themselves, and do not write it anywhere else.

## Step 1 - set up

Parse `$ARGUMENTS`:

- a number = how many items (default 10, maximum 30 per session)
- `d1` to `d5` = one domain; a task id such as `4.3` = one task statement; `weak` = the user's weakest areas (below); `mixed` or nothing = spread across domains in proportion to the weights
- `professional` = the Professional track (Step 2b)

If `$ARGUMENTS` is empty, ask ONE AskUserQuestion with three questions, recommended default first in each: how many (10 / 5 / 20), focus (mixed by weight / my weak spots / one domain), feedback (after each item / only at the end).

`weak`: read `./cert-notes/drill-log.md` and `./cert-notes/rules.md` if they exist. Pick the task statements with the lowest accuracy and the most logged rules. If neither file exists, say so and fall back to mixed.

## Step 2a - anchor to the guide (Foundations, the default)

Look for the official guide: a PDF the user attached or pasted in this conversation, or `./cert-notes/exam-guide.pdf` (or any `./cert-notes/*guide*.pdf`). If found, read the section for the task statements you will drill and anchor every key to the guide's own "Knowledge of" and "Skills in" wording.

If no guide is available, say once: "For the most faithful questions, save the official guide as ./cert-notes/exam-guide.pdf (the link is in /cert-coach:foundations)." Then continue from the blueprint index above, and label the session "anchored to the plugin's index, not your copy of the guide".

## Step 2b - Professional track

This plugin ships no Professional blueprint yet: the Professional exam's content changes on 7 December 2026 and Anthropic publishes the new guide on 17 November 2026. The user must supply the guide (attached, pasted, or `./cert-notes/exam-guide-professional.pdf`).

1. Read the guide's blueprint. List its domains, weights and objectives back in a short table with the guide's version and date, and ask the user to confirm it matches their exam date. If the exam is on or after 7 December 2026, the guide must be the one published on 17 November 2026 or later; say so if it is not.
2. Use the guide's objectives in place of the Foundations task ids, and its own scenario framing in place of the six Foundations scenario types. Everything else in this skill applies unchanged.

## Step 3 - serve and grade

Write each item just before serving it, following the item rules. Serve it with AskUserQuestion:

- `header`: "Q3 of 10"
- `question`: the setting, then the stem, then the select line. Do not shorten the stem: reading long scenario stems is part of what is being trained.
- `options`: A to D in order; `label` = the letter plus 3 to 6 words; `description` = the full option text.
- `multiSelect: true` for "(Select TWO)" items.

If AskUserQuestion is not available, print the item and ask the user to reply with the letter or letters.

After each answer (or at the end, if the user chose that):

1. **Right or wrong**, plainly.
2. **Key** and **task statement id** with its guide title.
3. **Deciding fact**: the words in the stem that decide it.
4. **One line per losing option**: why it loses here, and the constraint under which it would win.
5. **Exam key versus current reality**, only when the topic is in that table.

On a **miss**:

- Append one rule to `./cert-notes/rules.md` (create `./cert-notes/` and the file if missing, and tell the user the path once). One line:
  `- When <deciding fact>, the answer is <right pattern>, not <the trap they picked>. (task <id>, <YYYY-MM-DD>)`
- Then serve the **flip** as a bonus item: same setting, one constraint changed, different key. Grade it, but do not count it in the score.

A multiple-response item with one right and one wrong pick is a miss; say which half was right.

## Step 4 - score and log

At the end report:

- Correct out of total, and the percent. Do not convert it to a scaled score: the exam's scaling is not public, and a percent on generated practice items is not a prediction of a result.
- A small table by domain and by task statement, weakest first.
- Multiple-response items, correct out of total, kept separate.
- The three traps that cost the most, named in plain words.
- What next: `/cert-coach:tutor <task id>` for the weakest task statement, and `/cert-coach:drill weak` next time.
- The rules added this session, listed, with one line: "Rewrite any of these in your own words; your own words stick better."

Append one row to `./cert-notes/drill-log.md` (create it with this header if missing):

```
| Date | Track | Focus | Items | Correct | Percent | Task ids drilled | Missed task ids |
|---|---|---|---|---|---|---|---|
```

`weak` mode computes accuracy per task id from the last two columns across all rows.
