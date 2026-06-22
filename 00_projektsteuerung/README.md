# Projektsteuerung – LF5 (Kraut und Rüben / Bio-Kochbox)

Diese Datei erklärt kurz die **Arbeitsstruktur** des Projekts. Sie ist nur die
Organisation – das eigentliche Projekt ist **noch nicht gestartet**.

---

## Wichtiger Hinweis: Projekt noch nicht gestartet

> Aktuell ist nur die **Projektstruktur eingerichtet**.
> Es wurden **keine** inhaltlichen Aufgaben bearbeitet, keine Dokumentation
> ausgearbeitet und keine Umsetzung begonnen.
>
> **Die nächsten Schritte erfolgen erst nach ausdrücklicher Freigabe.**

---

## Ordnerstruktur – wofür ist was?

| Ordner | Wofür gedacht |
|---|---|
| `00_projektsteuerung/` | Steuerung des Projekts (diese README, Scrum, Entscheidungen, Notizen) |
| `00_projektsteuerung/scrum/` | Backlog, Sprintplanung, Daily-/Retro-Notizen |
| `00_projektsteuerung/entscheidungen/` | Festgehaltene Team-Entscheidungen (kurz, nachvollziehbar) |
| `00_projektsteuerung/notizen/` | Lose Notizen, offene Fragen, Zwischenstände |
| `01_quellen_und_vorgaben/` | Kopien/Verweise auf Vorgaben, bereitgestellte Materialien (z. B. DB-Dump) |
| `02_planung/` | Planungsunterlagen (z. B. ERD-Entwürfe, Konzepte) |
| `03_dokumentation/lerndokumentation/` | Erklärungen zum **Verstehen/Lernen** (Theorie kurz erklärt) |
| `03_dokumentation/anleitungen/` | **Schritt-für-Schritt-Anleitungen** zum Nachmachen |
| `04_umsetzung/` | Eigentliche Arbeitsergebnisse (z. B. SQL-Skripte, ERD-Dateien) |
| `05_tests_und_pruefung/` | Testfälle, erwartete Ergebnisse, Prüfprotokolle |
| `06_abgabe/` | Finale Unterlagen für Abgabe/Präsentation/Fachgespräch |
| `.claude/agents/` | Spezialisierte Claude-Subagents (siehe unten) |

> Die wichtigsten Vorgaben liegen im Projektwurzelverzeichnis:
> `Planning-Agreement-LF05.md`, `Bewertungsbogen_LF5.md`, `Projekt-Kontext.md`,
> `szenario-1.md`. Die Regeln für Claude stehen in `CLAUDE.md` (Wurzelverzeichnis).

---

## Vorhandene Subagents – wann nutze ich welchen?

| Subagent | Wofür | Wann einsetzen |
|---|---|---|
| `lern-doku-agent` | Lerndokumentation und Schritt-für-Schritt-Anleitungen auf Azubi-Niveau | Wenn etwas erklärt oder eine ausführbare Anleitung erstellt werden soll |
| `scrum-aufgaben-agent` | Projekt in Aufgaben, Arbeitspakete und Sprints aufteilen | Wenn die Projektplanung **freigegeben** wurde |
| `scope-bewertungs-agent` | Inhalte gegen Scope und Bewertungsmatrix prüfen | Vor/nach dem Erstellen von Inhalten – passt alles zu Vorgaben und Bewertung? |
| `abgabe-qualitaets-agent` | Abgabeunterlagen auf Vollständigkeit und Verständlichkeit prüfen | Kurz vor Abgabe/Präsentation |

Alle Subagents:
- richten sich nach `Planning-Agreement-LF05.md` und `Bewertungsbogen_LF5.md`,
- halten **Berufsschulniveau** (kein Overengineering),
- **starten keine inhaltliche Arbeit ohne ausdrückliche Anweisung**.

---

## Mögliche nächste Schritte (erst nach Freigabe)

Diese Schritte sind **noch nicht** ausgeführt – sie sind nur eine Orientierung:

1. Team, Rollen und Regeln festlegen (Scrum-Vorbereitung).
2. Backlog im Ordner `00_projektsteuerung/scrum/` aufbauen.
3. Discovery-Track / Lerndokumentation zu den Fachthemen beginnen.
4. ERD/ERM und Normalisierung planen (`02_planung/`).

> Diese Schritte werden **erst auf ausdrückliche Anweisung** begonnen.
