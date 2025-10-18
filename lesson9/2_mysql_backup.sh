#!/bin/bash
TIME_STAMP=`date +%Y%m%d%H%M%S`
OUT_DIR=/opt/mysql_backup/
BACKUP=/usr/bin/mysqldump
DB=lesson9_db

echo "[+] Start backuping MySQL Database lesson9_db"

if [ ! -d "$DIRECTORY" ]; then
  mkdir -p "$OUT_DIR"
fi

$BACKUP -p'password' --databases $DB > "$OUT_DIR$DB-$TIME_STAMP".sql

ls -al $OUT_DIR
