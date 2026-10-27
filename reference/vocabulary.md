# Words the exam guide assumes you know

The guide is written for people who ship software. If you do not, these are the words worth learning first, in the sense the guide uses them.

- **CI/CD, pipeline.** The automated assembly line a code change travels down: someone submits a change, and the pipeline builds it, tests it and ships it with nobody watching. Think of an automated workflow whose trigger is "someone submitted code".
- **Pull request (PR).** A proposed code change waiting for review before it joins the main codebase.
- **Repository, repo root.** The project folder with all the code and its history. The root is its top level, where shared configuration files live.
- **Non-interactive, headless.** Running with no human present to answer questions. In Claude Code that is the `-p` flag.
- **Session.** One continuous conversation with its own memory. "A separate session" means starting fresh with nothing carried over, which is why a review should not happen in the session that wrote the code.
- **Hook.** A small piece of code that fires at a fixed moment, such as before or after a tool call. The client enforces hooks; it cannot skip them the way a model can ignore a prompt.
- **Schema.** A declared shape for data: which fields exist, their types, which are required. A schema is how you guarantee the format of an answer.
- **Glob.** A filename pattern with wildcards. `**/*.test.ts` means every file ending in `.test.ts`, in any folder.
- **Stateless.** The server remembers nothing between requests, so every request carries the whole conversation. That is why context size is a design problem.
- **Frontmatter.** The small settings block at the top of a markdown file, between two `---` lines, where things like a skill's name and options are declared.
- **MCP (Model Context Protocol).** A standard way to plug outside systems (a ticket tracker, a database) into Claude as tools and resources.
- **Tool use, tool_choice.** Tool use is the model asking your code to run a named function with structured inputs. tool_choice says whether it may answer in plain text ("auto"), must call some tool ("any"), or must call one named tool.
- **stop_reason.** A field on every model response that says why it stopped: "tool_use" means it wants a tool run, "end_turn" means it is finished.
- **Subagent, coordinator.** A coordinator is the agent that plans and hands out work; a subagent is a helper agent it starts for one job, with its own fresh memory.
