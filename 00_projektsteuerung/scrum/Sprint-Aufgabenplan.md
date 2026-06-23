# Sprint-Aufgabenplan – LF5 (Kraut und Rüben / Bio-Kochbox)

> **Zweck:** Dieses Dokument zerlegt das gesamte LF5-Projekt in alle Aufgaben, die
> sich im Team aufteilen lassen, geordnet nach **Sprints** (Scrum-Verfahren).
> Es dient als **Product Backlog + Sprintplanung** für die Gruppe.
>
> **Quellen (Source of Truth):** `Planning-Agreement-LF05.md`, `Bewertungsbogen_LF5.md`,
> `Projekt-Kontext.md`, `szenario-1.md`. Bei Widersprüchen gelten Planning-Agreement
> und Bewertungsbogen vor allem anderen.
>
> **Niveau:** Berufsschule / Ausbildung. Kein Overengineering. Es wurde nichts erfunden –
> alle Aufgaben stammen direkt aus den Vorgaben.

---

## 1. Team & Rollen (Scrum)

Das Team besteht aus **3 Mitgliedern**. **Alle sind am kompletten Prozess beteiligt**
(Vorgabe). Die Rollen sind organisatorisch, nicht als Arbeitstrennung gemeint.

| Rolle | Aufgabe (organisatorisch) | Vorschlag |
|---|---|---|
| Product Owner (PO) | Hält Anforderungen/Backlog aktuell, priorisiert | Mitglied A |
| Scrum Master (SM) | Achtet auf Ablauf, moderiert Daily/Retro, räumt Hindernisse weg | Mitglied B |
| Entwickler:in (Dev) | Setzt um (ERD, SQL, Doku) – **das machen alle drei** | A, B, C |

> Die konkrete Rollenverteilung wird im Team festgelegt und in
> `00_projektsteuerung/entscheidungen/` festgehalten.
> Für das **SuK-Reflexionsgespräch nach Belbin** zusätzlich die Belbin-Teamrollen notieren
> (siehe Sprint 0, Aufgabe V-5).

---

## 2. Legende

- **ID:** Eindeutige Aufgaben-Nummer (für Scrum-Board / Daily).
- **Status:** ☐ offen · ◐ in Arbeit · ☑ erledigt
- **DoD:** Definition of Done – woran erkennen wir, dass die Aufgabe fertig ist.
- **Bewertung:** Worauf im `Bewertungsbogen_LF5.md` diese Aufgabe einzahlt.
- **P/O:** **P** = Pflicht · **O** = Optional (laut Vorgabe).
- **Fachrichtung:** Manche Aufgaben sind nur Pflicht für FIAE/FIDP (siehe Hinweise).

---

## 3. Sprint-Überblick

| Sprint | Titel | Ziel (Outcome) | Wichtiger Meilenstein |
|---|---|---|---|
| **Sprint 0** | Vorbereitung | Team, Regeln, Board, Backlog stehen | – |
| **Sprint 1** | Discovery Track | Fachwissen + Projektziel sitzen | – |
| **Sprint 2** | Conceptual & Logical Design | ERM + Normalisierung (3. NF) fertig | **Mid-Project-Checkpoint** (ERD + importierbare DB) |
| **Sprint 3** | DB anpassen & Testdaten | DB läuft mit Struktur + Testdaten | – |
| **Sprint 4..x** | Entwicklung der Abfragen | Alle Pflicht-Abfragen + DSGVO-Skript | – |
| **Sprint n** | Continuous Improvement (optional) | Adressen, Zahlung, ggf. GUI/NoSQL | – |
| **Abschluss** | Kompetenznachweis | Präsentation + Fachgespräch + SuK | **Customer Meeting & Expert-Talk (100 % der Note)** |

> Nach **jedem Sprint**: **Product Demo + Team-Retro** (in `00_projektsteuerung/scrum/` notieren).

---

## Sprint 0 – Vorbereitung

**Ziel:** Arbeitsfähiges Team mit Board, Regeln und gefülltem Backlog.

| ID | Aufgabe | DoD | Verantw. | P/O | Bewertung |
|---|---|---|---|:--:|---|
| V-1 | Team bilden, Stärken/Kompetenzen klären | Teamzusammensetzung dokumentiert | alle | P | – |
| V-2 | Rollen + Teamregeln festlegen (Kommunikation, Tools, Erreichbarkeit) | Regeln in `entscheidungen/` festgehalten | alle | P | – |
| V-3 | Scrum-Board einrichten (Trello/MeisterTask) und Spalten anlegen | Board existiert, Spalten: Backlog/Doing/Done | SM | P | – |
| V-4 | Repository + ggf. IDE einrichten; Ablage-/Namenskonvention klären | Repo erreichbar, erste Datei eingecheckt | Dev | P | Skripte müssen im Repo gepflegt sein (Vorgabe) |
| V-5 | Belbin-Teamrollen je Mitglied einschätzen (für SuK-Gespräch) | Selbsteinschätzung notiert | alle | P | SuK-Reflexion (Belbin) |
| V-6 | Product Backlog aus diesem Plan ins Board übertragen | Alle Aufgaben als Karten im Board | PO | P | – |
| V-7 | Zeitplan/Termine grob festlegen (Checkpoint, Abgabe) | Termine im Board/Kalender | SM | P | – |

**Demo/Retro:** Kurzer Check „Sind wir arbeitsfähig?" + erste Retro.

---

## Sprint 1 – Discovery Track (Fachwissen aufbauen)

**Ziel:** Jede:r versteht die Grundlagen; Projektziel ist gemeinsam formuliert.
Ergebnis ist eine **Zusammenfassung der wichtigsten Erkenntnisse**.

> Diese Themen sind zugleich **direkte Vorbereitung auf das Fachgespräch** (Teil 2 der Note).
> Aufteilung im Team möglich, aber **alle lesen die Zusammenfassungen** (Fachgespräch
> prüft jede:n einzeln).

| ID | Aufgabe (Discovery / Lerndoku) | DoD | Verantw. | P/O | Bewertung (Fachgespräch) |
|---|---|---|---|:--:|---|
| D-1 | Grundverständnis Datenbanken: Was ist eine DB? Datenbankarten, Vor-/Nachteile relationaler DB | Kurz-Zusammenfassung (1 Seite) in `lerndokumentation/` | A | P | ⭐ Grundverständnis Datenbanken (Pflicht) |
| D-2 | Datenmodellierung/ER-Modell: PK, FK, Kardinalitäten (1:1, 1:n, n:m) | Kurz-Zusammenfassung + Beispiele | B | P | ⭐ Datenmodellierung (Pflicht) |
| D-3 | Normalisierung: 1NF, 2NF, 3NF, Anomalien, Zerlegung | Kurz-Zusammenfassung mit Beispiel | C | P | Normalisierung (wählbar) |
| D-4 | SQL-Grundlagen: SELECT, WHERE, GROUP BY, ORDER BY, INNER/LEFT JOIN | Spickzettel mit Beispielen | A | P | SQL-Verständnis (wählbar) |
| D-5 | Sicherheit & Rechte: Datenschutz, Zugriffskontrolle, Backup/Restore, SQL-Injection | Kurz-Zusammenfassung | B | P | Sicherheit und Rechte (wählbar) |
| D-6 | Scrum-Grundlagen im Team klären (Sprint, Demo, Retro, Backlog) | Gemeinsames Verständnis notiert | SM | P | – |
| D-7 | **Wählbaren 3. Fachgespräch-Bereich festlegen** (Normalisierung / SQL / Sicherheit) | Entscheidung in `entscheidungen/` | alle | P | bestimmt 3. geprüften Bereich |
| D-8 | Projektziel + Leitfragen beantworten (Problem des Kunden, Auftrag, Frist, Quellen) | 1-seitige Projektziel-Notiz | PO | P | Präsentation: Inhalt/Struktur |
| D-9 | **Fachrichtung des Teams klären** (FiSi/ITSE vs. FIAE/FIDP) → bestimmt Pflicht-/Optional-Abfragen | Festgelegt + im Backlog markiert | alle | P | Umfang Abfragen |

**Demo/Retro:** Zusammenfassungen vorstellen; Wissenslücken benennen.

---

## Sprint 2 – Conceptual & Logical Database Design

**Ziel:** Vollständiges, normalisiertes **ERM** für die Bio-Kochbox-Erweiterung.
**Wichtig:** Am Ende steht der **Mid-Project-Checkpoint** (siehe unten).

> **Hinweis (Vorgabe):** SQL-Implementierung ist hier **noch nicht** nötig – nur Modell.

### Conceptual Design (Informationen sammeln)

| ID | Aufgabe | DoD | Verantw. | P/O | Bewertung |
|---|---|---|---|:--:|---|
| K-1 | IST-ERD sichten (`ERD_ist_Zustand.drawio`): Kunde, Bestellung, Zutat, Lieferant | IST verstanden + notiert | alle | P | Datenmodellierung |
| K-2 | Alle zu verwaltenden Infos sammeln: Kundendaten, Rezepte, Bestelldaten | Sammlung in `02_planung/` | PO | P | Inhalt |
| K-3 | Neue Anforderungen auflisten: Rezepte, Ernährungskategorien, Allergene/Beschränkungen, Nährstoffe pro Zutat | Anforderungsliste (aus Szenario) | PO | P | Inhalt vollständig |

### Logical Design (ERM entwerfen)

| ID | Aufgabe | DoD | Verantw. | P/O | Bewertung |
|---|---|---|---|:--:|---|
| M-1 | Neue Entitäten modellieren: **Rezept** | Entität mit Attributen im ERM | A | P | Datenmodellierung |
| M-2 | **Ernährungskategorie** modellieren + Beziehung zu Rezept | Entität + Kardinalität festgelegt | B | P | Datenmodellierung |
| M-3 | **Beschränkung/Allergen** modellieren + Beziehung (Rezept/Zutat) | Entität + Kardinalität (n:m) | C | P | Datenmodellierung |
| M-4 | **Rezept ↔ Zutat** als n:m-Beziehung mit Attribut **Menge** modellieren | Zwischentabelle vorgesehen | A | P | Datenmodellierung (n:m) |
| M-5 | Zutat um fehlende **Nährstoffe** erweitern: Fett, Ballaststoffe, Natrium | Attribute ergänzt | B | P | Inhalt |
| M-6 | PK/FK für alle neuen Tabellen festlegen; Kardinalitäten eintragen | Alle Schlüssel/Kardinalitäten im ERM | C | P | Datenmodellierung (PK/FK) |
| M-7 | **Normalisierung bis 3. NF** prüfen und durchführen | ERM erfüllt mind. 3. NF, dokumentiert | alle | P | Normalisierung |
| M-8 | ERM → **Relationenschema** ableiten | Relationenschema in `02_planung/` | A | P | Datenmodellierung |
| M-9 | Tippfehler/IST-Mängel berücksichtigen (z. B. „Stasse" → Strasse) | Im Soll-ERM korrigiert | B | P | Inhalt korrekt |
| M-10 | **ERD/ERM sauber als Diagramm** erstellen (draw.io o. ä.) | Lesbare ERD-Datei in `04_umsetzung/` | C | P | Gestaltung/Inhalt |

### Meilenstein: Mid-Project-Checkpoint (max. 15 Min., **ungraded, aber Pflicht**, Englisch)

| ID | Aufgabe | DoD | Verantw. | P/O | Bewertung |
|---|---|---|---|:--:|---|
| C-1 | Bereitgestellte DB importieren und zeigen, dass sie **ohne Syntaxfehler** läuft | Import erfolgreich, FK-Constraints greifen | Dev | P | Checkpoint-Pflicht |
| C-2 | **Aktualisiertes ERD** mit neuen Entitäten präsentieren | ERD-Stand vorgestellt | alle | P | Checkpoint-Pflicht |
| C-3 | Kurzpräsentation (Englisch) für den Checkpoint vorbereiten | Folien/Notizen bereit | PO | P | Sprachübung für Endabgabe |

**Demo/Retro:** ERM mit Partnergruppe abgleichen, Erweiterbarkeit prüfen.

---

## Sprint 3 – Datenbank anpassen & Testdaten

**Ziel:** Lauffähige Datenbank mit neuer Struktur und realistischen Testdaten.

| ID | Aufgabe | DoD | Verantw. | P/O | Bewertung |
|---|---|---|---|:--:|---|
| DB-1 | Entwicklungsumgebung + DBMS aufsetzen (HeidiSQL) | Tool läuft bei allen | Dev | P | Nutzung/Deployment |
| DB-2 | Bereitgestellten DB-Dump importieren | DB importiert | A | P | Deployment (Dump) |
| DB-3 | **DDL** für neue Tabellen schreiben (Rezept, Ernährungskategorie, Beschränkung, Zwischentabellen) | `CREATE TABLE`-Skripte in `04_umsetzung/` | B | P | Inhalt/Nutzung |
| DB-4 | DDL für Erweiterungen bestehender Tabellen (Zutat: Fett/Ballaststoffe/Natrium) | `ALTER TABLE`-Skripte | C | P | Inhalt |
| DB-5 | FK-Constraints + Beziehungen umsetzen, auf 3. NF achten | Constraints aktiv, Struktur passt zu ERM | A | P | Datenmodellierung |
| DB-6 | **DML**: bereitgestellte Rezepte/Daten per `INSERT`/`UPDATE` einpflegen | Testdaten in allen Tabellen | B | P | Nutzung |
| DB-7 | Eigene sinnvolle Testdaten ergänzen (Kategorien, Allergene, Mengen) | Genug Daten zum Testen der Abfragen | C | P | Tests |
| DB-8 | Deployment-Struktur/**Dump** erzeugen (für Endabgabe) | Re-importierbarer Dump im Repo | Dev | P | „Deployment-Struktur (dump)" |
| DB-9 | Alle Skripte versioniert ins Repo legen (DDL, DML) | Skripte aktuell im Repo | alle | P | Repo-Pflicht (Vorgabe) |

**Demo/Retro:** DB neu importieren und zeigen, dass alles reproduzierbar läuft.

---

## Sprint 4..x – Entwicklung der Abfragen

**Ziel:** Alle geforderten SQL-Abfragen + DSGVO-Skript, jeweils getestet.
**Vorgehen:** Anforderung umgangssprachlich → SQL → Testfall mit erwartetem Ergebnis.

> Aufteilung: Abfragen lassen sich gut einzeln auf A/B/C verteilen. **Jede Abfrage
> bekommt einen Testfall** (Sprint-übergreifend, siehe Q-T).

### Pflicht-Abfragen (alle Fachrichtungen)

| ID | Abfrage | DoD | Verantw. | P/O | Bewertung |
|---|---|---|---|:--:|---|
| Q-1 | Alle Zutaten eines Rezeptes (nach Rezeptname) | Liefert korrektes Ergebnis | A | P | SQL-Verständnis |
| Q-2 | Alle Rezepte einer bestimmten Ernährungskategorie | korrekt | B | P | SQL-Verständnis |
| Q-3 | Alle Rezepte, die eine gewisse Zutat enthalten | korrekt | C | P | SQL-Verständnis |
| Q-4 | Durchschnittliche Nährwerte aller Bestellungen eines Kunden | korrekt (Aggregat) | A | P | SQL (Aggregatfunktion) |
| Q-5 | Alle Zutaten, die bisher **keinem** Rezept zugeordnet sind | korrekt (LEFT JOIN/Subselect) | B | P | SQL (JOIN/Subselect) |

### Optional für FiSi/ITSE – **Pflicht für FIAE/FIDP**

| ID | Abfrage | DoD | Verantw. | P/O | Bewertung |
|---|---|---|---|:--:|---|
| Q-6 | Alle Rezepte, die eine bestimmte Kalorienmenge nicht überschreiten | korrekt | C | P (FIAE)/O | SQL-Verständnis |
| Q-7 | Alle Rezepte mit weniger als fünf Zutaten | korrekt (Aggregat + HAVING) | A | P (FIAE)/O | SQL-Verständnis |
| Q-8 | Alle Rezepte mit < 5 Zutaten **und** bestimmter Ernährungskategorie | korrekt | B | P (FIAE)/O | SQL-Verständnis |

### Zusätzliche Pflicht-Bestandteile (laut Vorgabe)

| ID | Aufgabe | DoD | Verantw. | P/O | Bewertung |
|---|---|---|---|:--:|---|
| Q-9 | Mind. **drei eigene** sinnvolle Abfragen entwickeln | 3 Abfragen + Zweck dokumentiert | alle | P | SQL-Verständnis |
| Q-10 | Sicherstellen: mind. je 1× `INNER JOIN`, `LEFT/RIGHT JOIN`, **Subselect**, **Aggregatfunktion** | Abdeckung nachgewiesen (Mapping-Tabelle) | PO | P | SQL-Verständnis |
| Q-11 | **FIAE/FIDP:** mind. **drei Stored Procedures** | 3 lauffähige Procedures | Dev | P (FIAE)/O | SQL-Verständnis |
| Q-12 | **FIAE/FIDP:** Trigger (falls sinnvoll laut Teilhandlung 4) | Trigger umgesetzt/erklärt | Dev | O | SQL-Verständnis |

### DSGVO (technische Umsetzung – Pflicht)

> **Scope (Vorgabe):** Kein Rechtsgutachten. Technische Umsetzung als SQL-Skript,
> mit dem **Mitarbeitende** (nicht Endkunden) Kundendaten **auskunft­en und löschen** können.

| ID | Aufgabe | DoD | Verantw. | P/O | Bewertung |
|---|---|---|---|:--:|---|
| G-1 | **Auskunfts-Skript**: alle personenbezogenen Daten eines Kunden ausgeben | Skript liefert Kundenauskunft | A | P | Sicherheit/Datenschutz |
| G-2 | **Lösch-Skript**: Kundendaten auf Anfrage löschen (FK-Abhängigkeiten beachten) | Löschung läuft ohne FK-Fehler | B | P | Sicherheit/Datenschutz |
| G-3 | Kurze Erklärung, wie Mitarbeitende die Skripte anwenden | Anleitung in `anleitungen/` | C | P | Präsentation (DSGVO) |
| G-4 | *(Optional)* Zugriffskontrolle personenbezogener Daten (Rechte/Rollen) | Konzept/Umsetzung | Dev | O | Sicherheit und Rechte |

### Tests & Qualität (für alle Abfragen)

| ID | Aufgabe | DoD | Verantw. | P/O | Bewertung |
|---|---|---|---|:--:|---|
| Q-T | Pro Abfrage einen **Testfall** mit erwartetem Ergebnis anlegen | Testtabelle in `05_tests_und_pruefung/` | alle | P | Tests/Inhalt korrekt |
| Q-R | Bei Abweichungen Struktur **oder** Abfrage überarbeiten | Alle Tests „grün" | alle | P | Inhalt korrekt |
| Q-D | Alle Abfragen + Skripte versioniert ins Repo | Repo aktuell | alle | P | Repo-Pflicht |

**Demo/Retro nach jedem Sprint:** Fertige Abfragen vorführen, Testergebnisse zeigen.

---

## Sprint n – Continuous Improvement (optional)

**Ziel:** Sinnvolle Weiterentwicklung – nur, wenn Zeit bleibt. Gut als „nächste Schritte"
in der Präsentation (Bewertung: **Nutzung – Weiterentwicklung**).

| ID | Aufgabe | DoD | Verantw. | P/O | Bewertung |
|---|---|---|---|:--:|---|
| I-1 | Adressspeicherung verbessern: getrennte **Liefer-/Rechnungsadresse** | ERM/DDL erweitert | A | O | Nutzung/Weiterentwicklung |
| I-2 | Konzept Zahlungsdaten/Zahlungsarten, ggf. **Abo-Modell** | Konzept dokumentiert | B | O | Nutzung/Weiterentwicklung |
| I-3 | *(Optional)* GUI-Anbindung (PHP, HTML/CSS, OOP) | Lauffähige Mini-Oberfläche | Dev | O | Nutzer-Schnittstelle |
| I-4 | *(Optional)* NoSQL-Lösung für Bewegungsdaten | Prototyp/Konzept | Dev | O | Weiterentwicklung |

> **Scope-Warnung:** GUI und NoSQL sind **optional** – nur mit klarem Auftrag und nur,
> wenn Pflichtteile vollständig fertig sind. Kein Overengineering.

---

## Abschluss – Kompetenznachweis (100 % der Note)

### Präsentation – Customer Meeting (15 Min., Englisch, **50 % der Note**)

> Zielgruppe: Kunde **ohne** technisches Vorwissen → technischen Nutzen in **Geschäftswert**
> übersetzen. Bewertet: Inhalt, Nutzung, Struktur, Präsentation, Gestaltung (je 5 P).

| ID | Aufgabe | DoD | Verantw. | P/O | Bewertung |
|---|---|---|---|:--:|---|
| P-1 | Storyline/roter Faden: Einleitung, Hauptteil, Schluss + Fazit | Gliederung steht | PO | P | Struktur (5) |
| P-2 | Inhalt: Lösung sachlich & kundenorientiert darstellen | Folien inhaltlich korrekt | A | P | Inhalt (5) |
| P-3 | Nutzung zeigen: Wie nutzt der Kunde die DB? Schnittstelle? Nächste Schritte? | Abschnitt „Nutzung" vorhanden | B | P | Nutzung (5) |
| P-4 | Folien gestalten: je Folie eine Aussage, Stichpunkte, sinnvolle Grafiken | Foliensatz fertig | C | P | Gestaltung (5) |
| P-5 | Live-Demo vorbereiten: DB-Import (Dump), Abfragen, DSGVO-Löschung | Demo läuft stabil | Dev | P | Inhalt/Nutzung |
| P-6 | Vortrag üben: Tempo, Tonfall, **Zeit ≤ 15 Min**, **alle reden** | Probedurchlauf bestanden | alle | P | Präsentation (5) |
| P-7 | DSGVO-Ausarbeitung in die Übergabe aufnehmen | Im Foliensatz enthalten | A | P | Inhalt |

### Fachgespräch / Expert-Talk (15 Min., Englisch, **50 % der Note**)

> **Nur 3 von 5 Bereichen** werden geprüft: ⭐ Grundverständnis DB + ⭐ Datenmodellierung
> (Pflicht) + 1 wählbarer Bereich (in D-7 festgelegt). Alle technischen Artefakte/Skripte mitbringen.

| ID | Aufgabe | DoD | Verantw. | P/O | Bewertung |
|---|---|---|---|:--:|---|
| F-1 | Wiederholung ⭐ Grundverständnis Datenbanken (aus D-1) | Jede:r kann es erklären | alle | P | Fachgespräch (10) |
| F-2 | Wiederholung ⭐ Datenmodellierung: PK/FK, Kardinalitäten (aus D-2) | Jede:r kann es erklären | alle | P | Fachgespräch (10) |
| F-3 | Wiederholung 3. gewählter Bereich (Normalisierung/SQL/Sicherheit) | Jede:r kann es erklären | alle | P | Fachgespräch (10) |
| F-4 | Alle Artefakte bündeln: ERD, DDL/DML-Skripte, Abfragen, DSGVO-Skript, Dump | Mappe/Ordner `06_abgabe/` vollständig | PO | P | Fachgespräch |
| F-5 | Eigene Abfragen erklären können (Warum JOIN/Subselect/Aggregat?) | Probefragen geübt | alle | P | SQL-Verständnis |

### SuK – Team-Reflexion nach Belbin (15 Min.)

| ID | Aufgabe | DoD | Verantw. | P/O | Bewertung |
|---|---|---|---|:--:|---|
| S-1 | Eigene Belbin-Rolle beschreiben (Einschätzung vs. tatsächlich) mit Beispielen | Notizen je Person | alle | P | SuK |
| S-2 | Teamrollen der Partner:innen analysieren | Analyse vorbereitet | alle | P | SuK |
| S-3 | Kernfrage beantworten: „Sind wir ein gut funktionierendes Team?" | Begründete Antwort | alle | P | SuK |
| S-4 | Termin mit Lehrkraft abstimmen | Termin fix | SM | P | SuK |

---

## 4. Definition of Done (für alle Aufgaben)

Eine Aufgabe ist **fertig**, wenn:

1. Das geforderte Artefakt existiert und im richtigen Ordner liegt (siehe README).
2. Es **ins Repo eingecheckt** und aktuell ist (Vorgabe: Skripte im Repo pflegen).
3. SQL läuft **ohne Fehler** und liefert das erwartete Ergebnis (Testfall vorhanden).
4. Es ist **verständlich** dokumentiert (Azubi-Niveau, nachvollziehbar/ausführbar).
5. Es passt zu **Scope** und zahlt nachvollziehbar auf den **Bewertungsbogen** ein.

---

## 5. Abdeckung Bewertungsbogen (Kontrolle)

| Bewertungsbereich | Abgedeckt durch |
|---|---|
| Präsentation – Inhalt | P-2, P-7, K-2/K-3 |
| Präsentation – Nutzung | P-3, P-5, I-* (nächste Schritte) |
| Präsentation – Struktur | P-1 |
| Präsentation – Präsentation (Vortrag) | P-6 |
| Präsentation – Gestaltung | P-4 |
| ⭐ Grundverständnis Datenbanken | D-1, F-1 |
| ⭐ Datenmodellierung (ER-Modell) | D-2, M-*, F-2 |
| Normalisierung (wählbar) | D-3, M-7, F-3 |
| SQL-Verständnis (wählbar) | D-4, Q-*, F-5 |
| Sicherheit und Rechte (wählbar) | D-5, G-*, F-3 |

> **Wichtig:** Im Fachgespräch zählen nur **3 von 5** Bereichen (max. 30 P).
> Den wählbaren 3. Bereich in **D-7** festlegen und gezielt vorbereiten.

---

## 6. Offene Punkte / im Team zu klären

- [ ] **Fachrichtung** des Teams (FiSi/ITSE vs. FIAE/FIDP) → entscheidet über Q-6..Q-8, Q-11 (siehe D-9).
- [ ] **Wählbarer 3. Fachgespräch-Bereich** (siehe D-7).
- [ ] Konkrete **Rollen-** und **Aufgabenverteilung** A/B/C festlegen.
- [ ] **Termine**: Mid-Project-Checkpoint, Endabgabe, SuK-Gespräch.
- [ ] Werden **optionale** Teile (GUI/NoSQL) angegangen? Nur bei freier Kapazität.
