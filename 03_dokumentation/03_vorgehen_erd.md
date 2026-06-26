Ableitung der zusätzlichen Entitäten aus der Aufgabenstellung

Aus der Aufgabenstellung werden die fachlichen Objekte abgeleitet, die zusätzlich gespeichert werden müssen.

| Anforderung aus der Aufgabenstellung                    | Abgeleitete Entität        |
| ------------------------------------------------------- | ------------------------- |
| Speicherung von Rezepten mit mehreren Zutaten           | REZEPT                    |
| Speicherung von Ernährungskategorien                    | ERNAEHRUNGSKATEGORIE      |
| Speicherung von Beschränkungen / Allergenen             | BESCHRAENKUNG             |

| Neue Entität           | Begründung                                                                 |
| ---------------------- | -------------------------------------------------------------------------- |
| REZEPT                 | Wird benötigt, weil Rezepte gespeichert werden sollen.                     |
| ERNAEHRUNGSKATEGORIE   | Wird benötigt, weil Rezepte nach Kategorien gefiltert werden sollen.       |
| BESCHRAENKUNG          | Wird benötigt, weil Allergene und Unverträglichkeiten gespeichert werden.  |

Die Entität ZUTAT ist bereits vorhanden und wird weiterverwendet.

Ergebnis der ERD-Erweiterung

Das ERD wird um folgende Entitäten erweitert:

* REZEPT
* ERNAEHRUNGSKATEGORIE
* BESCHRAENKUNG

Ergebnis als Liste Beziehungen

KUNDE → BESTELLUNG = 1:n
LIEFERANT → ZUTAT = 1:n
BESTELLUNG ↔ ZUTAT = n:m
REZEPT ↔ ZUTAT = n:m
REZEPT ↔ ERNAEHRUNGSKATEGORIE = n:m
ZUTAT ↔ BESCHRAENKUNG = n:m




