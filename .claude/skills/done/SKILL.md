---
name: done
description: Record a finished task — tick it in week-plan.md, write today's log entry, update progress and metrics, commit and push. Use when Jayasri says "done", "అయింది", "posted", "called", or reports any completed work.
---

# Done — write it, or it did not happen

1. **Confirm what was done in one line** and note the time ("done 11:05 — 45 min").
2. **`week-plan.md`:** mark that numbered task ✅ inside today's row (e.g. `1 ✅ · 2 ✅ · 3 ↔ backlog: …`) in the Status column; the row is ✅ when all are.
3. **Diary bullet in DailyUpdates** (`git -C ../DailyUpdates pull` first): under
   today's `## 📅 YYYY-MM-DD (Weekday)` → the mapped `### <Category>` (mapping
   in `CLAUDE.md`) in `DailyUpdates/Jayasri/<Month>/week-<N>.md`, one short
   past-tense bullet replacing `- _No updates_`. Tick any milestone it advances
   in `DailyUpdates/Jayasri/goals.md`. Commit `log(jayasri): YYYY-MM-DD updates`,
   push. If DailyUpdates is not in the session, write the bullet in this
   repo's `updates/` under the same date and say so — the next session moves it.
4. **Side effects:**
   - a video posted → `metrics.md` monthly row: videos +1, note the link
   - a school contacted / replied / meeting fixed → `templates/school-list.md` status + `metrics.md` schools contacted
   - a fee or batch size heard on a call → `metrics.md` research table
   - a number reported (subs, views) → `numbers` skill
   - a visit done → `visit-log` skill
   - a backlog item taken → remove it from `backlog.md`
5. **Say what is next** — the remaining task today, or "that's today, see you tomorrow" — and whether it fits before she stops.
6. **Commit and push this repo on `main`:** `plan: YYYY-MM-DD`. Both repos pushed.

Celebrate the specific thing ("first school on the list — that's the hardest one"). One line, no fireworks.
