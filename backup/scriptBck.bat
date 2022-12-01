rem 
cd "C:\Program Files\MySQL\MySQL Server 8.0\bin"

rem 
set mysql_user=root
set mysql_password=root

rem
set backup_path="C:\Users\Rafael\Desktop\backup"
set backup_name=bck_imobiliaria

rem
mysqldump --user=%mysql_user% --password=%mysql_password% imobiliaria --result-file="%backup_path%\%backup_name%.sql"
if %ERRORLEVEL% neq 0 (
    (echo Backup failed: error during dump creation) >> "%backup_path%\mysql_backup_log.txt"
) else (echo Backup successful) >> "%backup_path%\mysql_backup_log.txt"