#!/usr/bin/env bash
# Stop: if the repo has unsaved or unpushed work, say so — a task that was done
# but not written is invisible to the evening sweep.
d="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$d" || exit 0
msg=""
[ -n "$(git status --porcelain)" ] && msg="There are uncommitted changes in the coach repo. "
git status -sb | head -1 | grep -q ahead && msg="${msg}There are unpushed commits. "
if [ -n "$msg" ]; then
  printf '{"decision":"block","reason":"%sWrite today'"'"'s entry, commit on main and push before ending (CLAUDE.md → Saving anything)."}\n' "$msg"
fi
exit 0
