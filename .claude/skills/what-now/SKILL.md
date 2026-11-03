---
name: what-now
description: Give Jayasri exactly one task for this moment, with steps and today's status. Use whenever she asks "what should I do now / today", "ఇప్పుడు ఏం చేయాలి", "next", or opens a session without a question.
---

# What now — one task, one answer

1. **Run `bash scripts/today.sh`** and read `week-plan.md`. Note the time; if
   this is her first message today, that is her start time — say it back
   ("started 10:20").
2. **Pick the task.** The next unfinished numbered task in today's row of
   `week-plan.md`, in order. Today's row all done → the next day's first task
   ("ahead of plan"). No row → one item from `backlog.md`. The day is ~3
   hours; keep handing the next task until her time is used.
2a. **Needs material?** (footage, a reply, a list, a file from Vamsi) → ask
   first whether she has it. Not there → ⏭ with the reason, next task.
3. **Answer in this shape, nothing more:**
   - 🎯 **Task** — one line
   - **Why** — one line, tied to the target it serves
   - **Steps** — 3–6 numbered lines from the matching playbook (open it; do not paraphrase from memory)
   - **Done when** — one line she can check herself
   - **Today so far** — done · time used · of ~3 h, how much is left · what comes next (skip on the first message of the day)
4. **If she says "not this today" / "వద్దు":** offer **one** other task —
   the next one in today's row of a different kind, or an item from a
   different row of `backlog.md` (call ↔ edit ↔ write ↔ review). Mark the
   original ⏭ and the swap ↔ in `week-plan.md`. Never argue for the original.
5. **If she asks a how-to question mid-task:** answer from the playbook, one
   step at a time, then return to the task.
6. **When she says it is done:** run the `done` skill.

Keep it under 12 lines. Her language in, her language out; files stay English.
