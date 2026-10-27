# Exam key versus current reality

The exam is scored against the official exam guide. Claude Code and the Claude API change every few weeks, so today's documentation sometimes says something different from the guide. When that happens, **answer with the guide's wording**. When you explain a difference, write it as two labelled lines:

- **Exam key:** what the guide says, which is what to pick.
- **Current reality:** what today's docs say, useful at work, not in the exam.

Known differences, checked against the Foundations guide v1.0 and the Claude Code docs in October 2026:

| Topic | Exam key (guide v1.0) | Current reality (docs, October 2026) |
|---|---|---|
| `allowed-tools` in skill frontmatter | Restricts which tools a skill may use during its run (task 3.2). | Pre-approves the listed tools for the turn that invokes the skill, so they run without a permission prompt. It does not restrict the other tools. |
| Where slash commands live | Project commands in `.claude/commands/`, personal ones in `~/.claude/commands/` (task 3.2). | Commands still work, but the docs describe them as the older form; new work goes in a skill folder, `.claude/skills/<name>/SKILL.md`. |
| Spawning a subagent | The "Task" tool; a coordinator's allowedTools must include "Task" (task 1.3). | Newer releases may name the tool differently. If a question says "Task", that is the tool it means. |
| Cancel or reschedule window | Up to 24 hours before the appointment (guide section on registration). | The certification FAQ and Pearson say 48 hours. Plan for 48. This is logistics, not exam content. |

How to use this file:

1. Before teaching a convention, check whether it is in the table.
2. If you find a new difference while answering, tell the user, label it the same way, and do not guess which one the exam uses: the guide decides.
3. When the guide is silent on something, say so plainly. Do not invent an exam answer for it.
