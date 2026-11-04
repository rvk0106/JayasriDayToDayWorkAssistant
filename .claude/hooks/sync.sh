#!/usr/bin/env bash
# Auto-pull: keeps Jayasri's session on the latest data from Vamsi's sessions.
#
# Vamsi answers questions, re-plans the week and edits her goals from his own
# session and pushes. Without a pull, a session that is already open keeps
# reading the old files. This pulls this repo and DailyUpdates (the two repos
# her session opens), and tells the coach what Vamsi changed.
#
# Usage: sync.sh            — throttled (runs at most once every 3 minutes)
#        sync.sh --force    — always runs (SessionStart)
# Output goes into the coach's context; silent when nothing new arrived.
# Never blocks the session: every failure is reported and the hook exits 0.

coach="$(cd "$(dirname "$0")/../.." && pwd)"
force=0; [ "$1" = "--force" ] && force=1

# Throttle: a pull before every single message is wasted time.
stamp="$coach/.git/last-auto-sync"
if [ $force -eq 0 ] && [ -f "$stamp" ]; then
  last=$(cat "$stamp" 2>/dev/null || echo 0)
  [ $(( $(date +%s) - last )) -lt 180 ] && exit 0
fi
date +%s > "$stamp" 2>/dev/null

# DailyUpdates sits next to this repo in the session (/home/user/<repo>);
# match its folder name in any letter case.
daily=""
for p in "$(dirname "$coach")"/*; do
  [ -d "$p/.git" ] || continue
  case "$(basename "$p" | tr 'A-Z' 'a-z')" in dailyupdates) daily="$p" ;; esac
done

pull() {  # $1 = repo dir, $2 = label
  local dir="$1" label="$2" old new
  cd "$dir" || return
  old=$(git rev-parse HEAD 2>/dev/null)
  # `timeout` is GNU-only; on a Mac without it, pull without the limit
  local t=""; command -v timeout >/dev/null 2>&1 && t="timeout 25"
  if ! $t git pull -q --rebase --autostash origin main >/dev/null 2>&1; then
    git rebase --abort >/dev/null 2>&1
    echo "⚠️ Auto-pull of $label failed (offline or a conflict) — run git pull in $label before writing."
    return
  fi
  new=$(git rev-parse HEAD)
  [ "$old" = "$new" ] && return
  echo "🔄 $label updated: $(git rev-list --count "$old..$new" 2>/dev/null) new commit(s) since this session last looked."
  git log --format='   • %s' "$old..$new" | head -5
  if [ "$label" = "coach repo" ]; then
    # Vamsi's answers: rows of questions-for-vamsi.md that changed
    ans=$(git diff "$old" "$new" -- questions-for-vamsi.md | grep -E '^\+\|' | grep -vE '^\+\| *(Date|-)')
    if [ -n "$ans" ]; then
      echo "📬 Vamsi answered / changed in questions-for-vamsi.md — tell Jayasri at the next natural pause:"
      echo "$ans" | sed 's/^+/   /' | head -10
    fi
    git diff --quiet "$old" "$new" -- week-plan.md || echo "📋 week-plan.md changed — re-read today's row before the next task."
  else
    git diff --quiet "$old" "$new" -- Jayasri/goals.md || echo "🎯 Jayasri/goals.md changed — re-read her targets."
  fi
}

pull "$coach" "coach repo"
[ -n "$daily" ] && pull "$daily" "DailyUpdates"
exit 0
