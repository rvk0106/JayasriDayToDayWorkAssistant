#!/usr/bin/env bash
# Prints today's status for the coach: date (IST), today's planned task, open
# tasks this week, and whether anything is unpushed. Used by the SessionStart
# hook and by the /what-now skill. Read-only.
cd "$(dirname "$0")/.." || exit 0
export TZ=Asia/Kolkata
today=$(date +%Y-%m-%d); day=$(date +%a); dom=$(date +%-d); mon=$(date +%b)
echo "📅 Today: $today ($day) · time now $(date +%H:%M) IST · week $(( (dom + 6) / 7 ))"
case "$day" in Sat|Sun) echo "🏖️ Weekend — leave. If she has come to make up a missed weekday, give the oldest unticked task of the week; otherwise nothing."; ;; esac
if grep -qE "^\| *$day $mon $dom *\| *🏖️" week-plan.md; then echo "🏖️ Day off (see week-plan.md → Calendar). No tasks today."; exit 0; fi
# today's row in week-plan.md: "| Tue Nov 3 |" style
row=$(grep -E "^\| *$day $mon $dom *\| *[0-9]+\." week-plan.md | head -1)
if [ -n "$row" ]; then
  task=$(echo "$row" | awk -F'|' '{print $3}' | sed 's/^ *//;s/ *$//')
  st=$(echo "$row" | awk -F'|' '{print $5}' | sed 's/^ *//;s/ *$//')
  echo "📋 Today's task: $task ${st:+· status: $st}"
else
  echo "📋 No row for today in week-plan.md — offer one from backlog.md or ask Vamsi to plan the week."
fi
echo "🔎 Open rows this week (no ✅):"
grep -E "^\| *(Mon|Tue|Wed|Thu|Fri|Sat|Sun) [A-Z][a-z]{2} [0-9]+ *\| *[0-9]+\." week-plan.md | grep -v "✅" | awk -F'|' '{printf "   • %s — %s\n", $2, $3}' | head -8
log="updates/$(date +%Y-%m)/week-$(( (dom + 6) / 7 )).md"
if [ -f "$log" ] && grep -q "## 📅 $today" "$log"; then echo "✅ Today already has a log entry in $log"; else echo "📭 No log entry yet for today ($log)"; fi
if [ -n "$(git status --porcelain 2>/dev/null)" ]; then echo "⚠️ Uncommitted changes in the repo — commit and push before the session ends."; fi
if git status -sb 2>/dev/null | head -1 | grep -q ahead; then echo "⚠️ Commits not pushed yet."; fi
