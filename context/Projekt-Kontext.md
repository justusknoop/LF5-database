# LF5 – Software zur Verwaltung von Daten anpassen

> Projekt-Kontext für **Szenario A – Geführter Einstieg** (Bio-Kochbox)
> Zusammengeführt aus der allgemeinen Lernfeld-Beschreibung und `szenario/szenario-1.md`.

---

## 1. Worum geht es?

Es gibt kaum eine Anwendung oder einen digitalisierten Geschäftsprozess, der nicht
an irgendeiner Stelle auf eine Datenbank zurückgreift.

In diesem Lernfeld arbeitet das **Scrum-Team** an der Datenbank des Kunden
**Kraut und Rüben** und macht sie für neue Geschäftsmodelle fit. Die Datenbank wird
**Sprint für Sprint** modelliert und angepasst, geeignete Abfragen werden erstellt,
getestet und optionale Erweiterungen ausgewählt.

Im Fokus stehen **Teamarbeit** und **Problemlösefähigkeit** an einer gemeinsamen,
komplexen Lernsituation.

## 2. Der Kunde – Kraut und Rüben

- **Ausbildungsbetrieb:** IT-Solutions GmbH, betreut viele Hamburger Start-Ups,
  geschätzt für Kreativität, Innovationsfreude und Lösungsorientierung.
- **Kunde:** **KRAUT UND RÜBEN** beliefert Hamburger Haushalte mit Bio-Produkten
  (saisonales Obst & Gemüse, Fleisch, Molkereiprodukte) von regionalen Bauern.
- **Geschäftslage:** Läuft gut. Die Geschäftsführung sieht Marktpotenzial in
  **individuellen Angeboten** und will neue Geschäftsideen erschließen – dazu muss
  die **bestehende Datenbank erweitert** werden.

## 3. Szenario A – Datenbank für Bio-Kochbox

> *"Die Arbeit mit Datenbanken ist für mich neu. Ich wünsche mir klare Rahmenbedingungen."*

**Zielgruppe:** Alle, für die die Arbeit mit Datenbanken **neu** ist. Das Szenario
liefert eine genaue Beschreibung der Kundenanforderungen, einen Überblick über die
notwendigen Handlungsschritte und deren Reihenfolge.

### Überblick
Kraut und Rüben möchte – aufbauend auf dem bestehenden Produktportfolio – einen
**Rezept-Service mit passender Rezept-Box** einführen. Kunden sollen Rezepte nach
**Ernährungskategorien** filtern und nach **Allergenen / Unverträglichkeiten** ein-
bzw. ausschließen können. Die Boxen werden später entsprechend der in den Rezepten
verwendeten Zutaten und Mengen bestückt.

Die bestehende relationale Datenbank (**Kunde, Bestellung, Zutat, Lieferant**) soll
so **erweitert** werden, dass diese Funktionen unterstützt werden.
Eine grafische Oberfläche ist **optional**.

---

## 4. Umzusetzende Kundenanforderungen

- Speicherung von **Rezepten** (bestehend aus mehreren Zutaten)
- Speicherung von **Ernährungskategorien** (z. B. Vegan, Vegetarisch, Frutarisch, Low Carb, High Protein)
- Speicherung von **Beschränkungen / Allergenen** (z. B. Laktose, Gluten, Erdnuss, Ei, Tomate)
- Speicherung von **Nährstoffangaben pro Zutat** (Kalorien, Proteine, Kohlenhydrate, Fett, Ballaststoffe, Natrium …)
- Zusammenstellung von Zutaten entsprechend eines Rezepts
- Auswahl von Rezepten nach Ernährungskategorie
- Auswahl bzw. Ausschluss von Rezepten auf Basis von Beschränkungen
- *Optional:* Zugriffskontrolle personenbezogener Daten
- **DSGVO-Konzept** für Auskunft und Löschung von Kundendaten (rechtliche Grundlagen + technische Umsetzung, z. B. als SQL-Skript)

---

## 5. Geforderte SQL-Abfragen

### Pflicht (alle)
- Alle Zutaten eines Rezeptes nach Rezeptname
- Alle Rezepte einer bestimmten Ernährungskategorie
- Alle Rezepte, die eine gewisse Zutat enthalten
- Durchschnittliche Nährwerte aller Bestellungen eines Kunden
- Alle Zutaten, die bisher keinem Rezept zugeordnet sind

### Optional für FiSi/ITSE, Pflicht für FIAE/FIDP
- Alle Rezepte, die eine bestimmte Kalorienmenge nicht überschreiten
- Alle Rezepte mit weniger als fünf Zutaten
- Alle Rezepte mit weniger als fünf Zutaten **und** einer bestimmten Ernährungskategorie

### Zusätzlich
- Mindestens **drei weitere eigene** Abfragen
- Mindestens je eine Abfrage mit `INNER JOIN`, `LEFT/RIGHT JOIN`, **Subselects** und **Aggregatfunktionen**
- FIAE/FIDP: mindestens **drei Stored Procedures**

---

## 6. Technische Teilhandlungen (laut Vorgabe)

| Schritt | Teilhandlung | Inhalt |
|---|---|---|
| 1 | Analyse & Anpassung des aktuellen ERD | IST-Zustand sichten, nötige Änderungen/Ergänzungen vornehmen |
| 2 | Realisierung der Änderungen (Normalisierung) | ERD → Relationenschema (mind. 3. NF), DB importieren, DDL anwenden |
| 3 | Einpflegen der bereitgestellten Daten | Bereitgestellte Rezepte per INSERT/UPDATE (DML) einfügen |
| 4 | Testfälle & Abfragen | Abfragen erstellen, mit erwarteten Ergebnissen abgleichen, ggf. Struktur/Abfragen überarbeiten; FIAE/FIDP: Stored Procedures & Trigger |
| 5 | GUI-Anbindung *(optional)* | DB an User Interface anbinden (PHP, HTML/CSS, OOP) |
| 6 | NoSQL-Lösung *(optional)* | Erweiterung um eine NoSQL-Lösung (Bewegungsdaten) |

---

## 7. Ausgangslage (IST-ERD)

> Quelle: `ERD_ist_Zustand.drawio` (mit draw.io geöffnet).
> Die folgende Beschreibung wurde mit dem tatsächlichen Diagramm abgeglichen.

**Bestehende Entitäten** (Primärschlüssel = PK):

| Entität | Attribute (PK unterstrichen) |
|---|---|
| **Kunde** | <u>KundenNr</u>, Vorname, Nachname, Strasse, HausNr, PLZ, Ort, Geburtsdatum, Email, Telefon |
| **Bestellung** | <u>BestellNr</u>, Bestelldatum, Rechnungsbetrag, KundenNr (Fremdschlüssel) |
| **Zutat** | <u>ZutatenNr</u>, Bezeichnung, Einheit, Nettopreis, Bestand, Kalorien, Protein, Kohlenhydrate, Lieferant |
| **Lieferant** | <u>LieferantenNr</u>, Lieferantenname, Strasse, HausNr, PLZ, Ort, Email, Telefon |

**Beziehungen (mit Kardinalitäten):**

- **Kunde** –(`tätigt`)– **Bestellung** → **1:n** (ein Kunde tätigt mehrere Bestellungen)
- **Bestellung** –(`enthält`)– **Zutat** → **n:m** (Attribut der Beziehung: **Menge**)
- **Lieferant** –(`liefert`)– **Zutat** → **1:n** (ein Lieferant liefert mehrere Zutaten)

> **Hinweise zum IST-Stand (aus dem Diagramm abgeleitet):**
> - Bei **Zutat** sind bereits **Nährwert-Felder** vorhanden (Kalorien, Protein,
>   Kohlenhydrate) sowie Einheit, Nettopreis, Bestand. Fett, Ballaststoffe und Natrium
>   (siehe Soll-Anforderungen, Abschnitt 4) fehlen noch.
> - Im Diagramm steht beim Lieferanten als Tippfehler „Stasse" (gemeint: Strasse).

Ein **Datenbank-Dump + Füll-Skript** werden zum Import in **HeidiSQL** bereitgestellt.

---

## 8. Vorgehen nach SCRUM (Sprintplan)

1. **Vorbereitung** – Team bilden, Rollen/Regeln festlegen, Scrum-Board (Trello/Meistertask) und ggf. GitLab + IDE einrichten, Backlog füllen.
2. **Sprint 1 – Discovery Track**
   - Selbststudium der Fachmodule (Datentheorie, ERD, Normalisierung, SQL, Scrum)
   - Ergebnis: Zusammenfassung der wichtigsten Erkenntnisse / SQL-Befehle, Teamrollen & -regeln, Projektziel
3. **Sprint 2 – Conceptual & Logical Database Design**
   - Conceptual Design: alle zu verwaltenden Informationen sammeln (Kundendaten, Rezepte, Bestelldaten)
   - Logical Design: **ERM** entwickeln
   - **Normalisierung** (mind. 3. Normalform)
   - Product Demo: ERM mit Partnergruppe abgleichen, Erweiterbarkeit prüfen
4. **Sprint 3 – Anpassen der Datenbank & Testdaten**
   - Entwicklungsumgebung + DBMS aufsetzen, bestehende DB importieren (HeidiSQL)
   - Geplante Strukturänderungen per DDL umsetzen
   - Datenbank mit Testdaten füllen (DML INSERT/UPDATE)
5. **Sprint 4 bis x – Entwicklung der Abfragen**
   - Kundenanforderungen umgangssprachlich → SQL-Abfragen
   - Features je Sprint umsetzen (z. B. „Filter nach Ernährungskategorie", „Filter nach Allergenen")
   - Testfälle entwickeln und gegen erwartete Ergebnisse prüfen
6. **Sprint n – Continuous Improvement**
   - Verbesserung Adressspeicherung (Liefer-/Rechnungsadresse)
   - Konzept für Zahlungsdaten / Zahlungsarten, ggf. Abo-Modell
7. **Kompetenznachweis** – Abschluss / Bewertung

> Nach **jedem Sprint**: Product Demo + Team Retro.

---

## 9. Team & Organisation

- Jedes Team besteht aus **drei Mitgliedern**; alle sind am **kompletten Prozess** beteiligt.
- Team **kompetenzorientiert** bilden, voneinander lernen, Stärken nutzen.
- Scrum-Team organisieren, Sprints planen, **Discovery Tracks** einplanen (recherchieren, Austausch mit anderen Teams & Lehrerteam).
- Backlog enthält **nicht nur technische** Aufgaben.

### Leitfragen zur Orientierung
- Welches Problem hat der Kunde Kraut und Rüben?
- Wofür wurde die IT-Solutions GmbH beauftragt?
- Warum ist es für den Kunden wichtig, das Problem zu lösen?
- Bis wann muss das Problem gelöst sein?
- Wo finden wir Informationen über Kunde & Fachthemen? (Infothekenmodule im Board speichern)
- Welche Diagramme werden benötigt?
- Wer ist wofür verantwortlich?
- Womit (Software, Methoden) und wie kommunizieren wir im Team?

### Hilfreiche Fachfragen
- Wie wird aus dem ERD ein Relationenschema?
- Welche Normalisierungsvorschriften sind zu beachten?
- Wie definiert ihr die Datenstruktur (DDL)?
- Wie ergänzt und fragt ihr Daten ab (DML)?

---

## 10. Leistungsnachweis (zwei Bestandteile)

1. **Technisches Fachgespräch:** Die Datenbank muss als **ERD und Skript** sowie die
   **SQL-Abfragen** vorliegen und fachlich-fundiert erklärt werden.
2. **Präsentation (Übergabe an den Kunden):** Beinhaltet den Projektabschluss **und**
   die **datenschutzrechtlichen (DSGVO-)** Ausarbeitungen.
   Kann aufgrund des internationalen Teams auf **Englisch** erfolgen – mit dem
   Lehrerteam abstimmen.

---

## 11. Tools & Methoden (Vorschläge aus dem Lernfeld)

- **DBMS / SQL-Client:** HeidiSQL (für Import des bereitgestellten Dumps)
- **Modellierung:** ERD / ERM, Relationenschema, Normalisierung (3. NF)
- **Scrum-Board:** Trello / MeisterTask
- **Versionierung/IDE:** ggf. GitLab + IDE
- **Optionale GUI:** PHP, HTML/CSS, OOP
- **Optional:** NoSQL-Lösung für Bewegungsdaten
