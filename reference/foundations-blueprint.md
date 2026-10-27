# Claude Certified Architect - Foundations (CCAR-F): blueprint index

Source: the public **Claude Certified Architect - Foundations Exam Guide, version 1.0, effective July 2026**, published by Anthropic:

- Exam guide PDF: https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F6nizmqk8tpzpfjvt6qmmav7rh%2Fpublic%2F1783542750%2FClaude+Certified+Architect+%E2%80%93+Foundations+Exam+Guide.pdf
- Exam page: https://anthropic-partners.skilljar.com/claude-certified-architect-foundations-certification

This file is an index, not a copy. The task statement titles below are the guide's own headings, so you can find them in the PDF. The "In plain words" lines are this plugin's summaries, written for people who do not write code. The guide's "Knowledge of" and "Skills in" bullets are the real anchor: read them in the PDF. When this file and the guide disagree, the guide wins. If Anthropic publishes a newer version, use the newer guide and treat this index as out of date.

## Format (from the guide)

| | |
|---|---|
| Exam code | CCAR-F |
| Items | 60, multiple choice and multiple response; each item states how many responses to select |
| Structure | 4 scenarios, drawn at random from a set of 6 |
| Time | 120 minutes |
| Pass | scaled score of 720 on a 100 to 1,000 scale |
| Fee | $125 USD before any partner discount |
| Valid | 12 months, free on-time renewal assessment |

Average time per item: 120 minutes / 60 items = 2 minutes.

## Domains and weights

| Domain | Name | Weight |
|---|---|---|
| D1 | Agentic Architecture & Orchestration | 27% |
| D2 | Tool Design & MCP Integration | 18% |
| D3 | Claude Code Configuration & Workflows | 20% |
| D4 | Prompt Engineering & Structured Output | 20% |
| D5 | Context Management & Reliability | 15% |

## The six scenario types (names from the guide)

Practice items are set in invented businesses of these six kinds. Read the guide's own one-paragraph description of each before drilling.

1. Customer Support Resolution Agent - an agent that resolves returns, billing and account issues through backend tools and knows when to hand over to a person.
2. Code Generation with Claude Code - a team using Claude Code day to day: CLAUDE.md, custom commands and skills, plan mode versus direct execution.
3. Multi-Agent Research System - a coordinator that hands research, analysis, synthesis and reporting to subagents and produces cited reports.
4. Developer Productivity with Claude - an agent that explores unfamiliar codebases with the built-in tools and MCP servers.
5. Claude Code for Continuous Integration - Claude Code running unattended in a pipeline: reviews, tests, pull request feedback, few false positives.
6. Structured Data Extraction - pulling fields out of messy documents into a validated schema for a downstream system.

## Task statements

### D1 Agentic Architecture & Orchestration (27%)

| Id | Guide title | In plain words |
|---|---|---|
| 1.1 | Design and implement agentic loops for autonomous task execution | The loop keeps going while the model asks for a tool (stop_reason "tool_use") and stops when the model says it is finished ("end_turn"). Never by reading the wording, never by a fixed count as the main rule. |
| 1.2 | Orchestrate multi-agent systems with coordinator-subagent patterns | One coordinator plans, hands out work and collects results. Subagents talk only to the coordinator. A coordinator that splits a broad topic too narrowly leaves gaps. |
| 1.3 | Configure subagent invocation, context passing, and spawning | Subagents start with an empty memory, so the coordinator puts everything they need in their prompt. Several subagents in parallel = several spawn calls in one response. |
| 1.4 | Implement multi-step workflows with enforcement and handoff patterns | When a step order must hold every time, enforce it in code (a gate), not in the prompt. A handoff to a person carries a structured summary, because the person never saw the conversation. |
| 1.5 | Apply Agent SDK hooks for tool call interception and data normalization | Hooks are code that runs before or after a tool call: block a forbidden action before it happens, tidy messy tool output after it arrives. |
| 1.6 | Design task decomposition strategies for complex workflows | A fixed chain of steps for predictable jobs, an adaptive plan for open-ended investigation. Big reviews: one pass per file plus one cross-file pass. |
| 1.7 | Manage session state, resumption, and forking | Resume a named session when its context is still true. Start fresh with a summary when old tool results are stale. Fork to try two approaches from one shared starting point. |

### D2 Tool Design & MCP Integration (18%)

| Id | Guide title | In plain words |
|---|---|---|
| 2.1 | Design effective tool interfaces with clear descriptions and boundaries | The model picks a tool by reading its description. Vague or overlapping descriptions cause wrong picks; fix the description, rename or split the tool. |
| 2.2 | Implement structured error responses for MCP tools | Return errors with a category and a "can I retry" flag, not "Operation failed". An empty result is a successful answer, not an error. |
| 2.3 | Distribute tools appropriately across agents and configure tool choice | Each agent gets only the few tools its role needs. tool_choice "auto" may answer in prose, "any" must call some tool, a named tool forces that one. |
| 2.4 | Integrate MCP servers into Claude Code and agent workflows | Secrets become environment variables, and servers the whole team needs go in the project's .mcp.json. Personal or experimental servers go in the user-level config. Resources expose catalogs of content. |
| 2.5 | Select and apply built-in tools (Read, Write, Edit, Bash, Grep, Glob) effectively | Glob finds files by name, Grep searches inside files, Read opens one file, Edit changes one unique piece of text (fall back to Read then Write when it is not unique). Explore step by step. |

### D3 Claude Code Configuration & Workflows (20%)

| Id | Guide title | In plain words |
|---|---|---|
| 3.1 | Configure CLAUDE.md files with appropriate hierarchy, scoping, and modular organization | User-level (yours only, never shared), project-level (shared through the repo), folder-level. @import and .claude/rules/ keep it modular. /memory shows what actually loaded. |
| 3.2 | Create and configure custom slash commands and skills | Project commands and skills live in the repo for the team, personal ones in your home folder. Frontmatter options such as context: fork, allowed-tools, argument-hint. |
| 3.3 | Apply path-specific rules for conditional convention loading | A rule file with a paths glob loads only when matching files are touched. Best for conventions spread across many folders, such as test files. |
| 3.4 | Determine when to use plan mode vs direct execution | Plan mode for large, multi-file, architectural or multi-option work. Direct execution for small, clear changes. The Explore subagent keeps noisy discovery out of the main context. |
| 3.5 | Apply iterative refinement techniques for progressive improvement | Show 2 or 3 input/output examples when prose is misread. Write tests first and feed failures back. Let Claude interview you before building. Send interacting problems together, independent ones one at a time. |
| 3.6 | Integrate Claude Code into CI/CD pipelines | -p runs with no human present. --output-format json plus --json-schema gives machine-readable findings. CLAUDE.md carries project standards. A separate session reviews better than the one that wrote the code. |

### D4 Prompt Engineering & Structured Output (20%)

| Id | Guide title | In plain words |
|---|---|---|
| 4.1 | Design prompts with explicit criteria to improve precision and reduce false positives | Say exactly what to report and what to skip. "Be conservative" does not work. One noisy category makes people distrust the good ones. |
| 4.2 | Apply few-shot prompting to improve output consistency and quality | A few targeted examples beat longer instructions, for output format and for the ambiguous cases, and they help the model generalise. |
| 4.3 | Enforce structured output using tool use and JSON schemas | Tool use with a JSON schema guarantees the shape, not the truth. Fields the source may lack are optional or nullable. Enums get "other" plus a detail field. |
| 4.4 | Implement validation, retry, and feedback loops for extraction quality | Retrying with the exact error fed back fixes format problems, never missing information. Add fields that let you check the answer, such as a calculated total next to the stated one. |
| 4.5 | Design efficient batch processing strategies | Message Batches API: about half the cost, up to 24 hours, no latency promise, no tool round-trips inside one request, custom_id to match answers to requests. Never for anything someone is waiting on. |
| 4.6 | Design multi-instance and multi-pass review architectures | A fresh instance reviews better than self-review. Split big reviews into per-file passes plus an integration pass. |

### D5 Context Management & Reliability (15%)

| Id | Guide title | In plain words |
|---|---|---|
| 5.1 | Manage conversation context to preserve critical information across long interactions | Summaries blur numbers and dates, so keep a "case facts" block outside the summary. Trim bulky tool output. Put key findings first, because the middle of long inputs gets lost. |
| 5.2 | Design effective escalation and ambiguity resolution patterns | Escalate on an explicit request for a person, a gap in policy, or no progress. Not on sentiment or self-rated confidence. Several matching customers = ask for another identifier. |
| 5.3 | Implement error propagation strategies across multi-agent systems | Subagents fix passing failures themselves and report what they could not fix, with what they tried and partial results. Never hide a failure as an empty success; never stop everything for one failure. |
| 5.4 | Manage context effectively in large codebase exploration | Long sessions drift. Keep a scratchpad file of findings, hand verbose exploration to subagents, summarise between phases, use /compact, export state for crash recovery. |
| 5.5 | Design human review workflows and confidence calibration | A high overall accuracy can hide a weak document type or field. Measure by segment, sample the high-confidence items, calibrate confidence on labelled data, route doubtful cases to people. |
| 5.6 | Preserve information provenance and handle uncertainty in multi-source synthesis | Keep every claim tied to its source through every step. Show conflicting figures with their sources instead of picking one. Keep dates, so a difference in time is not read as a contradiction. |

## Out of scope (per the guide)

The guide lists topics that will not be tested, among them fine-tuning, API billing and authentication, hosting MCP servers, model internals and training, embeddings and vector databases, computer use, vision, streaming, rate limits and pricing calculations, cloud-provider configuration, benchmarks, prompt caching details beyond knowing it exists, and tokenization. Do not write practice items on these.
