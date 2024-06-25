```python
user@alt apt-get install pip 
user@alt pip install https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v8.8/pip/pgadmin4-8.8-py3-none-any.whl
user@alt cd /usr/local/lib/python3/site-packages/pgadmin4
user@alt apt-get install python3-module-pkg_resources
user@alt apt-get install python3-module-sqlite3 -y
user@alt apt-get install postgresql16-server
user@alt systemctl enable --now postgresql.service
user@alt /etc/init.d/postgresql initdb
user@alt pgadmin4
user@alt nano /etc/crontab
...
@reboot root pgadmin4 # запуск в фоне при перезагрузки
...
user@alt apt-get install apache2
user@alt apt-get install apache2-mod_php7
user@alt apt-get install php7-pgsql
user@alt mkdir /var/www/html/joomla
user@alt chown -R apache2:apache2 /var/www/html/joomla
user@alt service httpd2 start
user@alt chkconfig httpd2 on
user@alt wget https://downloads.joomla.org/ru/cms/joomla5/5-1-1/Joomla_5-1-1-Stable-Full_Package.zip?format=zip # с сайта надо качать последнюю версию на данный момент 5
user@alt unzip joomla_3-9-0-stable-full_package-zip.zip
```

