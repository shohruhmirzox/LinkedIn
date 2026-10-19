#!/bin/bash
# Point ~/.claude/linkedin (voice.md, plan.md, log.md read by the li-* skills)
# at the shared project folder when it exists, else seed it from this repo.
target="$HOME/.claude/linkedin"
shared="/mnt/project-files/linkedin"
repo="${CLAUDE_PROJECT_DIR:-$(pwd)}/.claude/linkedin"
[ -e "$target" ] && exit 0
mkdir -p "$HOME/.claude"
if [ -d "$shared" ]; then
  ln -s "$shared" "$target"
else
  mkdir -p "$target"
  cp -n "$repo"/voice.template.md "$target"/voice.md 2>/dev/null || true
fi
exit 0
