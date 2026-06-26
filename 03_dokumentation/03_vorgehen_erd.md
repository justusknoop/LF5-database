ergebnis als Liste Beziehungen

KUNDE → BESTELLUNG = 1:n
LIEFERANT → ZUTAT = 1:n
BESTELLUNG ↔ ZUTAT = n:m
REZEPT ↔ ZUTAT = n:m
REZEPT ↔ ERNAEHRUNGSKATEGORIE = n:m
ZUTAT ↔ BESCHRAENKUNG = n:m



| Kundenanforderung | Umsetzung im Soll-ERD |
|---|---|
| Speicherung von Rezepten | neue Entität `REZEPT` |
| Rezept besteht aus mehreren Zutaten | neue Zwischentabelle `REZEPT_ZUTAT` |
| Speicherung von Ernährungskategorien | neue Entität `ERNAEHRUNGSKATEGORIE` |
| Rezept kann mehrere Ernährungskategorien haben | neue Zwischentabelle `REZEPT_ERNAEHRUNGSKATEGORIE` |
| Speicherung von Beschränkungen / Allergenen | neue Entität `BESCHRAENKUNG` |
| Zutat kann Allergene/Beschränkungen enthalten | neue Zwischentabelle `ZUTAT_BESCHRAENKUNG` |
| Zusammenstellung von Zutaten nach Rezept | spätere SQL-Abfrage über `REZEPT_ZUTAT` |
| Auswahl von Rezepten nach Ernährungskategorie | spätere SQL-Abfrage über `REZEPT_ERNAEHRUNGSKATEGORIE` |
| Ausschluss von Rezepten wegen Allergenen | spätere SQL-Abfrage über `REZEPT_ZUTAT` und `ZUTAT_BESCHRAENKUNG` |
| DSGVO-Auskunft / Löschung | Konzept mit SQL-Abfragen und Anonymisierung |
| Zugriffskontrolle personenbezogener Daten | optional Tabellen wie `BENUTZER`, `ROLLE`, `BENUTZER_ROLLE` |

Neue Entitäten:
REZEPT
ERNAEHRUNGSKATEGORIE
BESCHRAENKUNG

Neue Zwischentabellen:
REZEPT_ZUTAT
REZEPT_ERNAEHRUNGSKATEGORIE
ZUTAT_BESCHRAENKUNG

Spätere SQL-Abfragen:
Zutaten eines Rezepts anzeigen
Rezepte nach Kategorie auswählen
Rezepte mit bestimmten Allergenen ausschließen
DSGVO-Auskunft erzeugen
Kundendaten löschen oder anonymisieren

