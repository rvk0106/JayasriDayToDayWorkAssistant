---
name: day-done
description: Close Jayasri's working day — consolidate everything she did into one compact summary, store it in today's log, and set up tomorrow. Use when she says "I'm done for the day", "done for today", "ఇవాళ్టికి అయింది", "closing", "bye", or stops for the day.
---

# Day done — consolidate, compact, store

1. **Gather today** from the session and the files: start time, every task
   touched (✅ done, ↔ swapped, ⏭ carried), calls made and their outcomes,
   anything posted, numbers reported, questions she asked, blockers.
2. **Write the summary block** at the end of today's entry in
   `updates/<YYYY-MM>/week-<N>.md`, after the category sections:

   ```
   ### 🌙 Day summary
   - Worked 10:20–12:05 (1h 45m)
   - Done: <task 1> · <task 2>
   - Carried to tomorrow: <task> (why, one phrase)
   - Numbers / outcomes: <school replied, 2 fees noted, clip posted (link)>
   - Blockers ⛔: <one line or "none">
   - Tomorrow: <the next row from week-plan.md>
   ```
   Five to seven lines, past tense, no commentary. If a category section
   above still shows `- _No updates_` for something she did, fix the bullet
   there first — the summary re-presents, it does not replace.
3. **Reconcile the files:** every done task has ✅ in `week-plan.md`; carried
   tasks are marked ⏭ and moved to the next free day; `progress.md` is left
   for Sunday.
4. **Tell her** the summary in her language, three lines max, and tomorrow's
   task in one line. End warmly, once.
5. **Commit and push on `main`:** `log(jayasri): YYYY-MM-DD day summary`.

The summary is the compact record of the day — the evening sweep, Sunday's
review, and the next session all read it first.
