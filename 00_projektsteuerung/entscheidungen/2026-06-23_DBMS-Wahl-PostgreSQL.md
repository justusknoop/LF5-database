# Entscheidung: PostgreSQL als DBMS

> **Status:** beschlossen
> **Datum:** 23.06.2026
> **Betrifft:** Datenbank-Management-System (DBMS) für das gesamte LF5-Projekt
> **Bereich:** Technische Grundlage (DDL, DML, Abfragen, Dump)

---

## 1. Entscheidung

Für die Umsetzung der Kraut-und-Rüben-Datenbank verwenden wir **PostgreSQL**
als Datenbank-Management-System.

Alle eigenen Artefakte (DDL-Skripte, Testdaten, SQL-Abfragen, DSGVO-Lösch-/
Auskunfts-Skript, der finale Dump) werden so erstellt, dass sie unter
**PostgreSQL** laufen.

---

## 2. Warum PostgreSQL?

- **Freies, weit verbreitetes DBMS** – kostenlos und gut dokumentiert.
- **Sauberes, standardnahes SQL** – passt gut zum Lernziel (DDL/DML, Normalisierung,
  Joins, Subselects, Aggregatfunktionen).
- **Stored Procedures / Funktionen** werden unterstützt – relevant für die
  Pflicht-Abfragen der Fachrichtung FIAE/FIDP (siehe `Projekt-Kontext.md`, Abschnitt 5).
- **Gute Tool-Unterstützung** (z. B. pgAdmin, DBeaver; HeidiSQL ab Version 11
  spricht ebenfalls PostgreSQL).

---

## 3. Wichtiger Hinweis zur Vorgabe (ehrlich festgehalten)

Die in `01_quellen_und_vorgaben/` bereitgestellten Dateien
(`sql_dump_database_create_neu.sql`, `krautundruebenload.sql`) sind in
**MySQL/MariaDB-Syntax** geschrieben. Auffällig sind u. a.:

| MySQL/MariaDB (Vorgabe) | PostgreSQL (unser Weg) |
|---|---|
| `CREATE DATABASE IF NOT EXISTS krautundrueben;` | `CREATE DATABASE krautundrueben;` (kein `IF NOT EXISTS`; Datenbank vorher prüfen/anlegen) |
| `USE krautundrueben;` | gibt es nicht – stattdessen Verbindung zur DB (`\c krautundrueben`) |
| `DROP DATABASE IF EXISTS …;` | identisch nutzbar |
| Backticks `` `Tabelle` `` | doppelte Anführungszeichen `"Tabelle"` oder einfach klein schreiben |

> **Konsequenz:** Beim Import muss das bereitgestellte Skript **leicht angepasst**
> werden, damit es unter PostgreSQL fehlerfrei läuft. Das ist kein Problem, sollte
> aber bewusst eingeplant werden (Sprint 3 – „DBMS aufsetzen, DB importieren").

> **Vorgabe-Bezug:** `Projekt-Kontext.md` (Abschnitt 11) und `Planning-Agreement-LF05.md`
> nennen **HeidiSQL** nur als **Vorschlag/Beispiel** für den SQL-Client, nicht als
> Pflicht. Die Wahl des DBMS steht uns frei. Im Zweifel mit dem Lehrerteam abstimmen.

---

## 4. Auswirkungen auf die Arbeit

- **DDL/DML:** in PostgreSQL-Syntax schreiben.
- **Import des Vorgabe-Dumps:** angepasste Variante erstellen (siehe Tabelle oben);
  die Original-Datei in `01_quellen_und_vorgaben/` bleibt **unverändert** als Quelle.
- **Stored Procedures (FIAE/FIDP):** als PostgreSQL-Funktionen / `PROCEDURE` umsetzen.
- **Dump für die Abgabe:** mit `pg_dump` erzeugen.
- **Doku/Anleitungen:** Schritt-für-Schritt auf PostgreSQL ausrichten
  (Installation, DB anlegen, Import, Abfragen).

---

## 5. Offene Punkte / nächste Schritte

- [ ] Angepasstes Import-Skript für PostgreSQL erstellen (erst nach Projektstart).
- [ ] SQL-Client festlegen (pgAdmin / DBeaver / HeidiSQL) und im Team einheitlich nutzen.
- [ ] Kurz mit dem Lehrerteam abstimmen, dass PostgreSQL statt HeidiSQL/MySQL in Ordnung ist.

---

*Diese Entscheidung folgt den Projektregeln in `CLAUDE.md`: Ausbildungsniveau,
kein Overengineering, nichts erfunden. Inhaltliche Umsetzung beginnt erst nach
ausdrücklicher Freigabe.*
