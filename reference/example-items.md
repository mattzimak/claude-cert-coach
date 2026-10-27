# Five example practice items

**These are original practice items, written for this plugin from the task statements in Anthropic's public exam guide.** None of them comes from the exam, from the sample questions in the guide, or from any question bank. Their job is to show the shape every generated item should have: one deciding fact in the stem, distractors that would each be right under one changed constraint, and a "flip one constraint" variant with a different answer.

The drill skill uses them as models only. It writes fresh items for every session.

---

## Example 1 - task 4.3 (structured output), single answer

*Setting:* A dental-supply wholesaler extracts supplier invoices into its accounting system with tool use and a JSON schema. About a third of the invoices carry no purchase-order number. The schema marks `po_number` as a required string. An audit finds invoices with plausible-looking PO numbers that appear nowhere in the source document.

*Question:* Which change fixes this most directly? (Select ONE)

- **A)** Add "Never invent a PO number" to the system prompt.
- **B)** Make `po_number` optional and nullable, so the model can return null when the invoice has no PO number.
- **C)** Retry each extraction with the validation error appended to the prompt.
- **D)** Set tool_choice to force the extraction tool on every call.

**Key: B.**
**Deciding fact:** a third of the invoices have no PO number, yet the schema demands one. A required field pushes the model to fill it, so it invents a value.
**Why the others lose, and when each would win:**
- A asks the model to resist a schema that still demands a value. It would be a reasonable add-on, never the fix.
- C would win if the PO number were in the document but in the wrong format. Here it is absent, and no retry can find what is not there.
- D would win if the model sometimes answered in prose instead of calling the tool. That is not the problem described.

**Flip one constraint:** every invoice has a PO number, but suppliers format it inconsistently ("PO 4471", "4471/PO") and the accounting system rejects some. Now **C** (retry with the specific error fed back, plus a format rule in the prompt) is right, and making the field nullable would only hide the problem.

---

## Example 2 - task 2.4 (MCP in Claude Code), multiple response

*Setting:* A 12-person agency wants every developer who clones its repository to get the same issue-tracker MCP server in Claude Code. The server needs an API token, and the security lead forbids secrets in git.

*Question:* Which TWO actions together meet both requirements? (Select TWO)

- **A)** Define the server in the project's `.mcp.json` at the repository root and commit it.
- **B)** Reference the token in that config as an environment variable, such as `${TRACKER_TOKEN}`, which each developer sets on their own machine.
- **C)** Ask each developer to add the server to their user-level config (`~/.claude.json`).
- **D)** Paste the token into `.mcp.json` and add `.mcp.json` to `.gitignore`.

**Key: A and B.**
**Deciding facts:** two requirements, so two actions. "Every developer who clones" means team-wide, so the config is committed at project scope. "No secrets in git" means the token comes from an environment variable.
**Why the others lose, and when each would win:**
- C would win for one person trying a server for themselves. For a team it is manual, drifts, and nobody new gets it by cloning.
- D keeps the secret out of git, but also keeps the whole server config out of git, so a fresh clone gets nothing. It fails the first requirement.

**Flip one constraint:** one developer wants to try a new MCP server for a week without affecting anyone else. Now **C** (user-level config) is right, and committing it to the project would be the mistake.

---

## Example 3 - task 2.5 (built-in tools), single answer

*Setting:* A developer-productivity agent must list every database migration file in a large monorepo before planning an upgrade. Migration files can sit in any folder, and their names always end in `.migration.sql`.

*Question:* Which built-in tool should the agent reach for first? (Select ONE)

- **A)** Grep, searching for the text "migration" across the repository.
- **B)** Glob, with the pattern `**/*.migration.sql`.
- **C)** Read, opening the files in each folder to see which are migrations.
- **D)** Bash, running a command that prints every file in the repository.

**Key: B.**
**Deciding fact:** the files are identified by their name, not by what is inside them.
**Why the others lose, and when each would win:**
- A searches inside files. It would win if the task were "find the files that contain something", and here it would also catch every file that merely mentions migrations.
- C reads everything up front, the most expensive way to explore. Read wins once you know which file to open.
- D dumps far more than needed and leaves the filtering to the model. Glob is the built-in tool for matching names.

**Flip one constraint:** the agent must find every file that calls the function `applyMigration()`. Now **A** (Grep) is right, because the thing you are looking for is inside the files.

---

## Example 4 - task 5.1 (long conversations), single answer

*Setting:* A utility company's billing-support agent handles long chats. To stay inside the context window, older turns are summarised every 20 messages. Customers complain that late in a chat the agent quotes the wrong refund amount and forgets the callback date it promised.

*Question:* What is the most reliable fix? (Select ONE)

- **A)** Move to a model with a larger context window and stop summarising.
- **B)** Summarise more often, so each summary is shorter.
- **C)** Extract amounts, dates and promised actions into a structured case-facts block that is sent with every request, outside the summarised history.
- **D)** Tell the agent, in the summarisation prompt, to take care to keep numbers exact.

**Key: C.**
**Deciding fact:** what gets lost is exact transactional facts (an amount, a date), and progressive summarisation is what blurs them.
**Why the others lose, and when each would win:**
- A is the standing "make it bigger" option. It costs more, postpones the problem, and long inputs still lose details in the middle. It would only be worth discussing if the conversations were short enough to fit with room to spare.
- B makes it worse: more summarising, more blurring.
- D asks for care inside the very step that causes the loss. A prompt hope, not a structure.

**Flip one constraint:** the chats are short, but every order lookup returns more than 40 fields and the agent needs 5 of them, so the context fills after a few lookups. Now the right fix is to trim tool results to the relevant fields before they enter the context.

---

## Example 5 - task 1.1 (agentic loop), single answer

*Setting:* A team's research agent ends its loop when the assistant's reply contains the word "done". In testing it sometimes stops halfway ("I'm done with the first source, moving on to the second") and sometimes keeps going after the task is finished.

*Question:* How should the loop decide when to stop? (Select ONE)

- **A)** Keep the word check, but switch to a rarer token such as `TASK_COMPLETE`.
- **B)** Continue while the response's stop_reason is "tool_use" and stop when it is "end_turn".
- **C)** Stop as soon as a response contains any text rather than only tool calls.
- **D)** Stop after a fixed 10 iterations.

**Key: B.**
**Deciding fact:** the stop signal belongs to the structure of the response, not to the wording of the text.
**Why the others lose, and when each would win:**
- A still parses natural language. A rarer word fails less often, not never.
- C fails because one response can contain text and a tool request at the same time.
- D would be right as a safety net next to B, never as the main stopping rule: it cuts long tasks short and lets short ones idle.

**Flip one constraint:** the loop already stops on stop_reason, and the question asks what to add so a runaway loop cannot burn the budget. Now a maximum iteration cap, as a backstop, is the right answer.
