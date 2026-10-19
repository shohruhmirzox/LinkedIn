# CLAUDE.md

## LinkedIn skills

This repo ships the 11 `li-*` skills from avi691/linkedin-agent-skill (MIT) in `.claude/skills/`:
/li-post, /li-comment, /li-reply, /li-profile, /li-plan, /li-human, /li-carousel, /li-repurpose, /li-dm, /li-inbox, /li-audit.

- Voice profile: `~/.claude/linkedin/voice.md`. The SessionStart hook links `~/.claude/linkedin` to `/mnt/project-files/linkedin/` in cloud threads, so plan.md and log.md persist. The real voice.md stays out of this public repo; `.claude/linkedin/voice.template.md` is the blank fallback.
- Facts: only numbers listed in voice.md or the `linkedin-personal-brand` skill. Never invent a metric.
- Claude drafts, Shokh posts. Never publish, message or log into LinkedIn.
- Humanizer: `python3 .claude/skills/li-human/humanize.py draft.txt -o clean.txt --report`, then `python3 .claude/skills/li-human/detect.py draft.txt clean.txt`.
