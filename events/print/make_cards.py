"""Orphanage hunt cards in the Magic Box deck style (Vamsi's make_grade1_sets.py): 55 x 80 mm slips, 9 per A4.
Questions are read from events/orphanage-2026-11-21.md -> Question sets table. Art: ../../../tutorcross-experiments
decode-locker cards/art (embedded). Run: python3 make_cards.py ART_DIR, then print the HTML to PDF."""
import re, html, sys, base64, pathlib
ART = pathlib.Path(sys.argv[1])
def img(name):
    return "data:image/jpeg;base64," + base64.b64encode((ART / name).read_bytes()).decode()
src = (pathlib.Path(__file__).parent.parent / "orphanage-2026-11-21.md").read_text()
rows = [m.groups() for l in src.splitlines()
        if (m := re.match(r"\| (Red|Blue|Green|Yellow|Orange) \| (\d) \| (\w+) \| (.+?) \| (.+?) \| .+\|$", l))]
assert len(rows) == 15, len(rows)
COL = {"Red": ("#d62828", "#fff"), "Blue": ("#1d4ed8", "#fff"), "Green": ("#15803d", "#fff"),
       "Yellow": ("#facc15", "#222"), "Orange": ("#ea7c13", "#fff")}
WHO = {"small": "Small children answer", "middle": "Middle children answer", "big": "Big children answer"}
ARTS = {"1": "treasure.jpg", "2": "farm.jpg", "3": "maths.jpg"}
def card(bg, fg, t, n, q, art, foot):
    return (f'<div class="card"><div class="head" style="background:{bg};color:{fg}"><div class="t">{t}</div>'
            f'<div class="n">{n}</div></div><div class="art"><img src="{img(art)}"></div>'
            f'<div class="q">{q}</div><div class="foot">{foot}</div></div>')
cards = [card(*COL[t], f"{t.upper()} TEAM · CARD", f"{n} of 3", html.escape(q), ARTS[n],
              f"{WHO[w]} · then bring this card to the table") for t, n, w, q, a in rows]
cards.append(card("#555", "#fff", "WARM-UP · HOW TO PLAY", "SAMPLE", "3 + 2 = ?", "treasure.jpg",
                  "Answer → bring the card → get your next card"))
cheat = "".join(f'<tr><td style="color:{COL[t][0] if t!="Yellow" else "#b48a00"};font-weight:bold">{t}</td><td>{n}</td>'
                f'<td>{w}</td><td>{html.escape(q)}</td><td class="k">{html.escape(a)}</td></tr>' for t, n, w, q, a in rows)
CSS = """@page { size: A4 portrait; margin: 10mm; } body { font-family: 'DejaVu Sans', Arial, sans-serif; margin: 0; color: #222; }
.sheet { display: grid; grid-template-columns: repeat(3, 55mm); grid-auto-rows: 80mm; gap: 6mm 8mm; page-break-after: always; }
.card { border: 0.4mm dashed #999; border-radius: 3mm; display: flex; flex-direction: column; overflow: hidden; }
.head { text-align: center; padding: 2mm 0; font-weight: bold; } .head .t { font-size: 3mm; letter-spacing: 0.2mm; }
.head .n { font-size: 9mm; line-height: 1.1; }
.art { height: 18mm; text-align: center; padding-top: 1.5mm; } .art img { height: 18mm; width: auto; }
.q { flex: 1; display: flex; align-items: center; justify-content: center; text-align: center; padding: 1.5mm 2.5mm; font-size: 4.4mm; line-height: 1.3; }
.foot { font-size: 2.8mm; text-align: center; padding: 2mm; color: #333; border-top: 0.3mm solid #ddd; }
h1 { font-size: 7mm; margin: 0 0 3mm; } p { font-size: 4mm; } table { border-collapse: collapse; width: 100%; font-size: 3.6mm; }
td, th { border: 0.3mm solid #999; padding: 1.5mm 2mm; text-align: left; vertical-align: top; } .k { font-weight: bold; font-size: 5mm; }"""
body = "".join(f'<div class="sheet">{"".join(cards[i:i+9])}</div>' for i in range(0, len(cards), 9))
out = (f'<!doctype html><html><head><meta charset="utf-8"><title>Orphanage hunt cards</title><style>{CSS}</style></head><body>'
       f'{body}<div><h1>Teacher cheat sheet — orphanage hunt, Sat 21 Nov</h1>'
       f'<p><b>Box key: 84</b> — card 2 gives 8, card 3 gives 4. Vamsi lays the Red tag card, the team types 8 4 #. '
       f'Answers are not on the cards; keep this sheet at the box.</p><table><tr><th>Team</th><th>Card</th><th>Who</th>'
       f'<th>Question</th><th>Answer</th></tr>{cheat}</table></div></body></html>')
(pathlib.Path(__file__).parent / "orphanage-hunt-cards.html").write_text(out)
print("cards:", len(cards))
