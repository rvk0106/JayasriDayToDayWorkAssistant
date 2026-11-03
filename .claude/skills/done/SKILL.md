---
name: done
description: Record a finished task — tick it in week-plan.md, write today's log entry, update progress and metrics, commit and push. Use when Jayasri says "done", "అయింది", "posted", "called", or reports any completed work.
---

# Done — write it, or it did not happen

1. **Confirm what was done in one line** and note the time ("done 11:05 — 45 min").
2. **`week-plan.md`:** mark that numbered task ✅ inside today's row (e.g. `1 ✅ · 2 ✅ · 3 ↔ backlog: …`) in the Status column; the row is ✅ when all are.
3. **`updates/<YYYY-MM>/week-<N>.md`** (N = ceil(day/7)): under today's
   `## 📅 YYYY-MM-DD (Weekday)` → the right `### <Category>` from
   `templates/categories.txt`, one short past-tense bullet. Create the heading
   if missing; never delete a heading.
4. **Side effects:**
   - a video posted → `metrics.md` monthly row: videos +1, note the link
   - a school contacted / replied / meeting fixed → `templates/school-list.md` status + `metrics.md` schools contacted
   - a fee or batch size heard on a call → `metrics.md` research table
   - a number reported (subs, views) → `numbers` skill
   - a visit done → `visit-log` skill
   - a backlog item taken → remove it from `backlog.md`
5. **Say what is next** — the remaining task today, or "that's today, see you tomorrow" — and whether it fits before she stops.
6. **Commit and push on `main`:** `log(jayasri): YYYY-MM-DD tasks`.

Celebrate the specific thing ("first school on the list — that's the hardest one"). One line, no fireworks.
