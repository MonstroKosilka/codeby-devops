sudo rsync -avz --password-file=/etc/rsync.secrets /opt/mysql_backup/ backup_user@192.168.21.106::mysql_backup
