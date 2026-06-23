# Jira-Import – Anleitung

Importdatei: **`Jira-Import.csv`** (UTF-8, Komma-getrennt).
Inhalt: alle Aufgaben aus `Sprint-Aufgabenplan.md` als **Epics + Stories**.

## Aufbau der CSV

| Spalte | Bedeutung |
|---|---|
| `Work item ID` | **eindeutige Zeilen-ID** (1–7 = Epics, ab 8 = Stories). Nur für den Import, wird nicht zur Jira-Nummer. |
| `Work type` | `Epic` (Projektphase) oder `Story` (Einzelaufgabe) |
| `Summary` | Titel inkl. Aufgaben-ID (z. B. „V-1: …") |
| `Parent` | bei Stories: **`Work item ID` des Epics** (z. B. `1` für Sprint 0). Bei Epics leer. |
| `Sprint` | Sprint 0 / 1 / 2 / 3 / 4+ / n / Abschluss (bei Epics leer) |
| `Priority` | Highest (Meilenstein) / High (Pflicht) / Medium / Low (optional) |
| `Label` (3×) | `LF5`, `Pflicht`/`Optional`, plus Tag (`Fachgespraech`, `DSGVO`, `Praesentation`, `SuK`, `Meilenstein`, `FIAE_FIDP`). Laut Atlassian-Vorgabe heisst die Mehrfach-Spalte **`Label`** (Singular, wiederholt). |
| `Description` | DoD, Owner-Vorschlag (A/B/C/PO/SM/Dev) und Bewertungsbezug |

> **Hinweis (neuer Jira-Import):** Der aktuelle Jira-Cloud-Import verlangt eine
> **`Work item ID`**-Spalte, eine **`Parent`**-Spalte (verweist auf diese ID) und
> **`Work type`** statt `Issue Type`. Die Hierarchie Epic → Story wird also über die
> **ID-Nummern** hergestellt (Story `Parent = 1` hängt unter Epic `Work item ID = 1`).
>
> **Epic-IDs:** 1 = Sprint 0 · 2 = Sprint 1 · 3 = Sprint 2 · 4 = Sprint 3 ·
> 5 = Sprint 4+ · 6 = Sprint n · 7 = Abschluss.

## Import in Jira (Cloud)

1. Zahnrad oben rechts → **System** → **External System Import** → **CSV**.
   (Alternativ im Projekt: **Project settings** → **Import**.)
2. CSV `Jira-Import.csv` hochladen, Encoding **UTF-8**, Delimiter **Comma**.
3. Zielprojekt wählen (Vorlage **Scrum**).
4. **Feld-Mapping** ("Map space fields") prüfen – die Spaltennamen passen i. d. R. automatisch:
   - `Work item ID` → **Work item ID** (Pflicht im neuen Import).
   - `Work type` → **Work type**, `Summary`/`Description`/`Priority`/`Label` → gleichnamig.
   - `Parent` → **Parent** (verknüpft Story über die `Work item ID` mit ihrem Epic).
   - `Sprint` → **Sprint** (Jira legt fehlende Sprints automatisch an).
5. **Werte den Work types zuordnen** ("Map values to work types") – **dieser Schritt
   ist Pflicht**, sonst kommt der Fehler „Missing work types" (siehe Hinweise):
   - Wert `Epic` → Jira-**Epic** (Hierarchie-Level 1).
   - Wert `Story` → Jira-**Story** (Level 0).
   - **Keinen Wert auf „unmapped/Default" stehen lassen.** Nicht zugeordnete Werte
     fallen sonst automatisch auf **Task (Level 0)** zurück.
6. Import starten und Vorschau bestätigen.

## Hinweise

- **Fehler „Missing work types":** Liegt **nicht** an der CSV (jede Zeile hat eine
  `Work type` `Epic`/`Story`), sondern am Wizard-Schritt **„Map values to work types"**
  (Schritt 5). Ursache meist: `Epic` wurde **nicht** zugeordnet → fiel auf **Task (Level 0)**
  zurück. Eine Story (Level 0), deren `Parent` dann auf ein Level-0-Item zeigt, zerstört
  die Hierarchie → Fehler. **Lösung:** `Epic` ausdrücklich auf **Epic (Level 1)**, `Story`
  auf **Story (Level 0)** mappen. Regel laut Atlassian: ein Kind darf nie auf ein
  **höheres/gleiches** Hierarchie-Level zeigen als sein Parent.
- **Falls „Epic" nicht auswählbar ist:** Im Zielprojekt fehlt die Vorgangsart **Epic**
  (z. B. reines Task-/Kanban-Projekt). Dann Projekt mit Vorlage **Scrum** nutzen bzw. die
  Vorgangsart **Epic** im Issue-Type-Scheme aktivieren, dann erneut importieren.
- **Work item ID nicht weglassen:** Fehlt sie, meldet der neue Import
  „Missing work item IDs". Die IDs sind reine Import-Hilfsnummern, keine späteren Jira-Keys.
- **Reihenfolge:** Epics (ID 1–7) stehen oben, dann die Stories – der `Parent`-Bezug
  über die ID greift dadurch zuverlässig.
- **Ältere Jira-Server (External System Import):** Dort heißt das Feld evtl. noch
  `Issue Type` bzw. `Epic Link`. Beim Mapping einfach `Work type` → `Issue Type`
  und `Parent` → `Epic Link` ziehen.
- **Assignee:** bewusst leer gelassen (echte Jira-Benutzernamen fehlen). Der Owner-Vorschlag
  (A/B/C bzw. Rolle) steht in der `Description` – nach dem Import den Mitgliedern zuweisen.
- **FIAE/FIDP:** Aufgaben Q-6…Q-8, Q-11, Q-12 sind als `Optional` + Label `FIAE_FIDP` markiert.
  Wenn euer Team FIAE/FIDP ist (siehe Aufgabe D-9), auf **Pflicht/High** hochstufen.
- **Story Points:** absichtlich nicht gesetzt – im Planning gemeinsam schätzen.
- Bei Umlaut-Problemen die CSV als UTF-8 prüfen oder beim Import-Encoding UTF-8 erzwingen.
