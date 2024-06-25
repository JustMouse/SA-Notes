Этот конфиг если не получится сделать по параметрам!!!
```python
user@alt apt-get install apache2
user@alt apt-get install apache2-mod_php7
user@alt apt-get install php7-mysql
user@alt mkdir /var/www/html/joomla
use[[Zabbix (без контейнера)]]r@alt chown -R  apache2:apache2 /var/www/html/joomla
user@alt service httpd2 start
user@alt chkconfig httpd2 on
user@alt apt-get install MySQL-server
user@alt service mysqld start
user@alt chkconfig mysqld on
user@alt mysqladmin -uroot password пароль
user@alt cd /var/www/html/joomla/
user@alt unzip Joomla_x.x.x-Stable-Full_Package-jino-ru.zip
user@alt chmod -R 777 /var/www/html/joomla //или
user@alt chmod -R 755 /var/www/html/joomla
user@alt /etc/php/X.X/apache2-mod_php/php.ini
user@alt output_buffering = off
user@alt systemctl restart httpd2
```
