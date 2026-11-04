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

@AGENTS.md
