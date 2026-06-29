#!/bin/bash
# ============================================================
# 02_load_daten.sh  –  Testdaten laden (aus der Vorgabe)
# ============================================================
# Dieses Skript wird vom PostgreSQL-Container beim ERSTEN Start
# automatisch ausgefuehrt (Reihenfolge: nach 01_schema.sql).
#
# Es laedt die Original-Vorgabe
#   01_quellen_und_vorgaben/krautundruebenload.sql
# die im Container unter /vorgaben/ eingehaengt ist.
#
# Die Vorgabe wird NICHT veraendert. Nur beim Einlesen wird die
# einzige MySQL-Zeile "USE krautundrueben;" weggefiltert, weil
# PostgreSQL diesen Befehl nicht kennt. Alle INSERTs bleiben gleich.
# ============================================================
set -e

VORGABE="/vorgaben/krautundruebenload.sql"

echo ">> Lade Testdaten aus ${VORGABE} (ohne MySQL-Zeile 'USE ...')"

grep -v -i '^[[:space:]]*USE[[:space:]]\+krautundrueben' "${VORGABE}" \
  | psql -v ON_ERROR_STOP=1 --username "${POSTGRES_USER}" --dbname "${POSTGRES_DB}"

echo ">> Testdaten erfolgreich geladen."
