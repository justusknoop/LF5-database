# Szenario A – Geführter Einstieg

> **Zielgruppe:** Alle, für die die Arbeit mit Datenbanken **neu** ist.
> Das Szenario liefert eine genaue Beschreibung der Kundenanforderungen, einen
> Überblick über die notwendigen Handlungsschritte und deren Reihenfolge..

## Überblick

Der Bio-Lebensmittelhändler **Kraut und Rüben** möchte – aufbauend auf dem
bestehenden Produktportfolio – einen **Rezept-Service mit passender Rezept-Box**
einführen. Kunden sollen Rezepte nach **Ernährungskategorien** filtern und nach
**Allergenen / Unverträglichkeiten** ein- bzw. ausschließen können. Die Boxen
werden später entsprechend der in den Rezepten verwendeten Zutaten und Mengen
bestückt.

Die bestehende relationale Datenbank (Kunde, Bestellung, Zutat, Lieferant) soll
so **erweitert** werden, dass diese Funktionen unterstützt werden. Eine grafische
Oberfläche ist **optional**.

## Umzusetzende Kundenanforderungen

- Speicherung von Rezepten (bestehend aus mehreren Zutaten)
- Speicherung von Ernährungskategorien (z. B. Vegan, Vegetarisch, Frutarisch, Low Carb, High Protein)
- Speicherung von Beschränkungen / Allergenen (z. B. Laktose, Gluten, Erdnuss, Ei, Tomate)
- Speicherung von Nährstoffangaben pro Zutat (Kalorien, Proteine, Kohlenhydrate, Fett, Ballaststoffe, Natrium …)
- Zusammenstellung von Zutaten entsprechend eines Rezepts
- Auswahl von Rezepten nach Ernährungskategorie
- Auswahl bzw. Ausschluss von Rezepten auf Basis von Beschränkungen
- *Optional:* Zugriffskontrolle personenbezogener Daten
- **DSGVO-Konzept** für Auskunft und Löschung von Kundendaten (rechtliche Grundlagen + technische Umsetzung, z. B. als SQL-Skript)

## Geforderte SQL-Abfragen

**Pflicht (alle):**
- Alle Zutaten eines Rezeptes nach Rezeptname
- Alle Rezepte einer bestimmten Ernährungskategorie
- Alle Rezepte, die eine gewisse Zutat enthalten
- Durchschnittliche Nährwerte aller Bestellungen eines Kunden
- Alle Zutaten, die bisher keinem Rezept zugeordnet sind

**Optional für FiSi/ITSE, Pflicht für FIAE/FIDP:**
- Alle Rezepte, die eine bestimmte Kalorienmenge nicht überschreiten
- Alle Rezepte mit weniger als fünf Zutaten
- Alle Rezepte mit weniger als fünf Zutaten **und** einer bestimmten Ernährungskategorie

**Zusätzlich:**
- Mindestens drei weitere eigene Abfragen
- Mindestens je eine Abfrage mit `INNER JOIN`, `LEFT/RIGHT JOIN`, Subselects und Aggregatfunktionen
- FIAE/FIDP: mindestens drei **Stored Procedures**

## Grober Aufgaben-/Sprintplan (SCRUM)

Das Szenario gibt eine **konkrete Sprintstruktur** vor:

1. **Vorbereitung** – Team bilden, Rollen/Regeln festlegen, Scrum-Board (Trello/Meistertask) und ggf. GitLab + IDE einrichten, Backlog füllen.
2. **Sprint 1 – Discovery Track**
   - Selbststudium der Fachmodule (Datentheorie, ERD, Normalisierung, SQL, Scrum)
   - Ergebnis: Zusammenfassung der wichtigsten Erkenntnisse / SQL-Befehle, Teamrollen & -regeln, Projektziel
3. **Sprint 2 – Conceptual & Logical Database Design**
   - Conceptual Design: alle zu verwaltenden Informationen sammeln (Kundendaten, Rezepte, Bestelldaten)
   - Logical Design: **ERM** entwickeln
   - **Normalisierung** (mind. 3. Normalform) anwenden
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

## Technische Teilhandlungen (laut Vorgabe)

| Schritt | Teilhandlung | Inhalt |
|--------|--------------|--------|
| 1 | Analyse & Anpassung des aktuellen ERD | IST-Zustand sichten, nötige Änderungen/Ergänzungen vornehmen |
| 2 | Realisierung der Änderungen (Normalisierung) | ERD → Relationenschema (mind. 3. NF), DB importieren, DDL anwenden |
| 3 | Einpflegen der bereitgestellten Daten | Bereitgestellte Rezepte per INSERT/UPDATE (DML) einfügen |
| 4 | Testfälle & Abfragen | Abfragen erstellen, mit erwarteten Ergebnissen abgleichen, ggf. Struktur/Abfragen überarbeiten; FIAE/FIDP: Stored Procedures & Trigger |
| 5 | GUI-Anbindung *(optional)* | DB an User Interface anbinden (PHP, HTML/CSS, OOP) |
| 6 | NoSQL-Lösung *(optional)* | Erweiterung um eine NoSQL-Lösung (Bewegungsdaten) |

## Ausgangslage (IST-ERD)

> Mit der bereitgestellten Datei `01_quellen_und_vorgaben/ERD_ist_Zustand.drawio`
> abgeglichen. Die ausführliche, abgeglichene IST-Beschreibung (alle Attribute)
> steht in `Projekt-Kontext.md`, Abschnitt 7.

Bestehende Entitäten und Beziehungen:

- **Kunde** –(`tätigt`)– **Bestellung** → **1:n**
- **Bestellung** –(`enthält`, Attribut *Menge*)– **Zutat** → **n:m**
- **Lieferant** –(`liefert`)– **Zutat** → **1:n**

Wesentliche Attribute (Auszug): Kunde (KundenNr, Name, Adresse, Geburtsdatum,
Email, Telefon), Bestellung (BestellNr, Bestelldatum, Rechnungsbetrag), Zutat
(ZutatenNr, Bezeichnung, Einheit, Nettopreis, Bestand sowie bereits Kalorien,
Protein, Kohlenhydrate), Lieferant (LieferantenNr, Name, Adresse, Email, Telefon).

Datenbank-Dump + Füll-Skript werden zum Import in HeidiSQL bereitgestellt.
