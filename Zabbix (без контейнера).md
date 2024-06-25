 ```python
user@debian wget https://repo.zabbix.com/zabbix/7.0/debian/pool/main/z/zabbix-release/zabbix-release_7.0-1+debian12_all.deb  
user@debian dpkg -i zabbix-release_7.0-1+debian12_all.deb  
user@debian apt update
user@debian apt install zabbix-server-mysql zabbix-frontend-php zabbix-nginx-conf zabbix-sql-scripts zabbix-agent
user@debian apt install mariadb
user@debian mysql -u root -p
mysql> create database zabbix character set utf8mb4 collate utf8mb4_bin;  
mysql> create user zabbix@localhost identified by 'P@ssw0rd';  
mysql> grant all privileges on zabbix.* to zabbix@localhost;  
mysql> set global log_bin_trust_function_creators = 1;
mysql> flush privileges;
mysql> quit;
user@debian zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -p zabbix
user@debian mysql -uroot -p
mysql> set global log_bin_trust_function_creators = 0;  
mysql> quit;
user@debian nano /etc/zabbix/zabbix_server.conf
...
DBPassword=P@ssw0rd
...
user@debian nano /etc/nginx/conf.d/zabbix.conf
...
#раскоментим первые две строки
listen 80;
server_name _;
...
user@debian nano /etc/nginx/sites-available/default
...
#коментим весь файл
...
user@debian systemctl restart zabbix-server zabbix-agent nginx
user@debian systemctl enable zabbix-server zabbix-agent nginx
```