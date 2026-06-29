# MySQL-Datenbank "krautundrueben" in Docker

Dieses Setup startet die Datenbank **krautundrueben** in einem **MySQL**-Container.
Beim ersten Start werden Datenbank, Tabellen und Testdaten **automatisch** angelegt.

> Hinweis: Es gibt parallel ein PostgreSQL-Setup unter `../docker/`.
> Beide sind voneinander unabhaengig (eigener Container, eigener Port, eigenes Volume).

## Was steckt drin?

| Datei | Zweck |
|-------|-------|
| `docker-compose.yml` | Definiert den MySQL-Container |

Die Tabellen und Daten kommen direkt aus den **Vorgabe-Dateien**
(`../../01_quellen_und_vorgaben/`):

| Vorgabe-Datei | Wird im Container ausgefuehrt als |
|---------------|-----------------------------------|
| `sql_dump_database_create_neu.sql` | `01_schema.sql` (Datenbank + Tabellen) |
| `krautundruebenload.sql` | `02_load_daten.sql` (Testdaten) |

## Warum keine portierte Fassung?

Die Vorgabe-Dateien sind bereits in **MySQL-Syntax** geschrieben
(`CREATE DATABASE IF NOT EXISTS`, `USE ...`, `AUTO_INCREMENT`). Auf MySQL laufen sie
deshalb **direkt** – im Gegensatz zum Postgres-Setup (`../docker/`), das eine
portierte Fassung braucht.

- Die Vorgaben bleiben **unveraendert** (nur read-only eingehaengt).
- Der MySQL-Container fuehrt alle Dateien in `/docker-entrypoint-initdb.d` beim
  ersten Start in alphabetischer Reihenfolge aus. Das Zahlen-Praefix `01_`/`02_`
  sorgt dafuer, dass zuerst das Schema und dann die Daten laufen.

## Voraussetzungen

- Docker Desktop (mit Docker Compose) installiert und gestartet.

## Starten

Im Ordner `04_umsetzung/docker-mysql/` ausfuehren:

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
| Port | `6001` |
| Datenbank | `krautundrueben` |
| Benutzer | `krautadmin` |
| Passwort | `krautpass` |

Direkt im Container per `mysql` verbinden:

```bash
docker exec -it krautundrueben-mysql mysql -u krautadmin -p krautundrueben
```

Beispiel-Abfragen zum Testen:

```sql
SELECT COUNT(*) FROM KUNDE;
SELECT * FROM ZUTAT LIMIT 5;
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
