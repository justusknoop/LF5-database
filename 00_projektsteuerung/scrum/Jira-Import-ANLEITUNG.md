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
4. **Feld-Mapping** ("Map space fields") – **jede Spalte per Dropdown selbst zuordnen.**
   Der neue Importer mappt **nicht** alles automatisch; vor allem `Work type` muss man
   **von Hand** setzen (sonst Fehler „Missing work types" / „Map work type to proceed"):
   - `Work item ID` → **Work item ID** (Pflicht im neuen Import).
   - `Parent` → **Parent** (verknüpft Story über die `Work item ID` mit ihrem Epic).
   - **`Work type` → `Work type`** – Dropdown am Kopf der Epic/Story-Spalte **manuell**
     auf *Work type* stellen (steht sonst auf „Don't import").
   - `Summary`/`Description`/`Priority`/`Label` → gleichnamig.
   - `Sprint` → **Sprint** (Jira legt fehlende Sprints automatisch an).
5. **Werte den Work types zuordnen** ("Map values to work types") – **dieser Schritt
   ist Pflicht**, sonst kommt der Fehler „Missing work types" (siehe Hinweise):
   - Wert `Epic` → Jira-**Epic** (Hierarchie-Level 1).
   - Wert `Story` → Jira-**Story** (Level 0).
   - **Keinen Wert auf „unmapped/Default" stehen lassen.** Nicht zugeordnete Werte
     fallen sonst automatisch auf **Task (Level 0)** zurück.
6. Import starten und Vorschau bestätigen.

## Hinweise

- **Fehler „Missing work types" (Meldung: „Add the work type column along with the
  parent ID and work item ID columns…", inline „Map work type to proceed"):**
  Liegt **nicht** an der CSV (jede Zeile hat eine `Work type` `Epic`/`Story`), sondern
  daran, dass im Screen **„Map space fields"** die **`Work type`-Spalte nicht gemappt**
  ist. Der neue Importer mappt diese Spalte **nicht** automatisch. Sobald `Work item ID`
  + `Parent` (für die Hierarchie) gemappt sind, verlangt er **zwingend** auch `Work type`.
  **Lösung – der Reihe nach:**
  1. **`Work type`-Spalte manuell mappen:** Dropdown am Kopf der Epic/Story-Spalte auf
     **`Work type`** stellen (Schritt 4). Danach erscheint Schritt 5 „Map values to
     work types" → dort `Epic` → **Epic (Level 1)**, `Story` → **Story (Level 0)**.
  2. **Falls `Work type` im Dropdown gar nicht auswählbar ist** oder `Epic`/`Story` im
     Wert-Mapping fehlen → die Vorgangsart fehlt im Zielprojekt:
     - **Company-managed:** *Settings → Issues → Issue Type Schemes* → Schema muss
       **Epic** + **Story** enthalten; *Settings → Issues → Screens* → Feld
       **Issue Type / Work type** auf den **Create-Screen** legen.
     - **Team-managed:** *Project settings → Issue types* → **Epic** + **Story**
       sicherstellen (Epic ggf. hinzufügen). Danach neu importieren.
  3. **Fallback (falls vorhanden):** Legacy *Settings → System → External System Import
     → CSV* – bietet `Issue Type` + `Epic Link` explizit und ist toleranter.
  4. **Notlösung laut Fehlermeldung:** `Parent` + `Work item ID` aus dem Mapping nehmen →
     importiert ohne Work types/Hierarchie. **Nicht empfohlen** (Epic→Story-Struktur geht
     verloren). Regel zur Hierarchie: ein Kind darf nie auf ein **höheres/gleiches**
     Level zeigen als sein Parent (Epic = Level 1, Story = Level 0).
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
