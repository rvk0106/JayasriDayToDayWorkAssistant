#!/usr/bin/env bash
# SessionStart: hand the coach today's status so the first reply already knows
# the date, the task and what is open. Output goes into the model's context.
d="$(cd "$(dirname "$0")/../.." && pwd)"
echo "=== Coach status (from scripts/today.sh) ==="
bash "$d/scripts/today.sh"
echo "=== Rules: one task at a time · match the mood · track time from when she sits · done means written and pushed ==="
