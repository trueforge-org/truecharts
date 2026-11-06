# CLAUDE.md

Claude Code instructions for TrueCharts. The canonical, tool-agnostic instructions live in `AGENTS.md`, imported below. The area-specific rules live in `.github/instructions/` and are symlinked into `.claude/rules/`, so Claude Code loads each one only when it works on files matching its `paths:` frontmatter. Update those files rather than this one.

## Sub-Agent Delegation

You MUST use available sub-agents whenever their description matches
the requested task.

- Check available agents before performing specialized work.
- Delegate the task to the most relevant agent using the Agent tool.
- Do not perform the delegated work yourself.
- Pass all relevant context and requirements to the sub-agent.
- Wait for its result before responding.
- Preserve the sub-agent's output and instructions.
- If no suitable agent is available, proceed normally.
- If a requested agent cannot be invoked, tell the user.

For tasks involving multiple specialties, delegate to the relevant
agents. Use parallel execution when appropriate.

The main agent coordinates work; sub-agents perform their
respective specialties.

### General rules for agents

- Using agents is often preferred over doing the work yourself. Delegate work that splits into independent parts, is repetitive (many pages, files or charts), or runs long (test runs, bulk edits, reviews), and run independent agents in parallel.
- Before you use a general-purpose agent (`general-purpose` or `claude`), evaluate whether a more specific agent fits the task, for example `haiku-docs` for docs and example files, `haiku-triage` for test and lint runs, `haiku-test-scaffold` for new unit tests, `haiku-bulk-edit` for one mechanical change in many files, `haiku-drafter` for commit and PR text, `haiku-lookup` for quick read-only questions, `Explore` for searching and `Plan` for designing. Use a general-purpose agent only when none of them fits.
- Check the result of an agent before you rely on it. Agents can be wrong or can go beyond their task.

@AGENTS.md
