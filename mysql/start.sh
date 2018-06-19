#!/bin/sh
set -e
if [ ! -d /var/lib/mysql/mysql ]; then
  echo "creating database"
  mysql_install_db --user mysql --rpm
  cat << EOF | mysqld --user mysql --bootstrap
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' identified by 'notsosecret' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' identified by 'notsosecret' WITH GRANT OPTION;
UPDATE user SET password = PASSWORD("") WHERE user='root' AND host='localhost';
EOF
fi
exec mysqld
