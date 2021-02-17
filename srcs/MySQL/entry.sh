mkdir -p /run/mysqld
mysql_install_db --user=root
echo "CREATE DATABASE IF NOT EXISTS wordpress;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO '$USER'@'%' IDENTIFIED BY '$PASSWORD' WITH GRANT OPTION;
FLUSH PRIVILEGES;" | mysqld -u root --bootstrap
mysqld -u root