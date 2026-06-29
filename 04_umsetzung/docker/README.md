# PostgreSQL-Datenbank "krautundrueben" in Docker

Dieses Setup startet die Datenbank **krautundrueben** in einem Docker-Container.
Beim ersten Start werden Tabellen und Testdaten **automatisch** angelegt.

## Was steckt drin?

| Datei | Zweck |
|-------|-------|
| `docker-compose.yml` | Definiert den PostgreSQL-Container |
| `init/01_schema.sql` | Legt die Tabellen an (PostgreSQL-Fassung der Vorgabe) |
| `init/02_load_daten.sh` | Laedt die Testdaten aus der Vorgabe |

## Wichtiger Hinweis zu den Vorgaben

Die Vorgabe-Dateien in `01_quellen_und_vorgaben/` sind in **MySQL/MariaDB-Syntax**
geschrieben (`CREATE DATABASE IF NOT EXISTS`, `USE ...`, `AUTO_INCREMENT`).
Auf **PostgreSQL** laufen sie so nicht. Deshalb:

- Die Vorgaben bleiben **unveraendert**.
- `init/01_schema.sql` ist die portierte PostgreSQL-Fassung des Tabellen-Skripts.
- `init/02_load_daten.sh` liest die **Original**-Datei `krautundruebenload.sql`
  und filtert beim Einlesen nur die eine MySQL-Zeile `USE krautundrueben;` heraus.
  Alle Daten (INSERTs) werden 1:1 uebernommen.

## Voraussetzungen

- Docker Desktop (mit Docker Compose) installiert und gestartet.

## Starten

Im Ordner `04_umsetzung/docker/` ausfuehren:

```bash
docker compose up -d
```

Der erste Start dauert kurz (Image wird geladen, Init-Skripte laufen).
Status pruefen:

```bash
docker compose ps
docker compose logs db
```

## Mit der Datenbank verbinden

| Einstellung | Wert |
|-------------|------|
| Host | `localhost` |
| Port | `5432` |
| Datenbank | `krautundrueben` |
| Benutzer | `krautadmin` |
| Passwort | `krautpass` |

Direkt im Container per `psql` verbinden:

```bash
docker exec -it krautundrueben-db psql -U krautadmin -d krautundrueben
```

Beispiel-Abfrage zum Testen:

```sql
SELECT COUNT(*) FROM kunde;
SELECT * FROM zutat LIMIT 5;
```

## Stoppen / Zuruecksetzen

```bash
# Container stoppen (Daten bleiben erhalten)
docker compose down

# Container stoppen UND Daten loeschen -> beim naechsten Start
# laufen die Init-Skripte komplett neu
docker compose down -v
```

> **Merke:** Die Init-Skripte laufen nur, wenn das Daten-Volume leer ist
> (also beim allerersten Start oder nach `docker compose down -v`).
