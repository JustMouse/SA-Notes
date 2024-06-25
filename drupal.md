ОО, это мега Drupal

`apt-get install nginx php8.2-fpm-fcgi php8.2-openssl -y`

Перейти в нужно директорию

`wget https://ftp.drupal.org/files/projects/drupal-10.3.0.zip`

`unzip drupal-10.3.0.zip`

`cp /etc/nginx/site-available.d/default.conf /etc/nginx/site-enabled.d/default.conf`

`nano /etc/php/8.2/fpm-fcgi/php.ini`

```bash
extension=php_openssl.so # Дописать
```

`nano /etc/nginx/site-enabled.d/default.conf`

Я брал отсюда: https://habr.com/ru/articles/320036/ . По запросу: php nginx конфиг. Далее, не забудьте, что ещё есть https.

```bash
server {
  listen *:80;
  server_name _;
  root /opt/drupal-10.3.0;
  index index.php;
  location / {
    try_files $uri $uri/ /index.php?$query_string;
  }
  location ~* \.php& {
    try_files $uri = 404;
    fastcgi_pass unix:/var/run/php8.2-fpm/php8.2-fpm.sock;
    fastcgi_index index.php;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    include fastcghi_params;
    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    aaccess_log /var/log/nginx/access.log;
  }
}
```


Качем расширения для php

`apt-get install php8.2-pdo_pgsql php8.2-xml php8.2-xml php8.2-gd php8.2-json php8.2-curl php8.2-mbstring -y`
Отсюда: https://www.drupal.org/docs/getting-started/system-requirements/php-requirements

Внутри БД, через pgadmin4 нужно выполнить активацию плагина:

`Servers > LocalDB > Databases > cms (Выше будет иконка БД и кнопкой play. ниже Object и Tools) > Выполнить запрос: "CREATE EXTENSION pg_trgm; > Ответ ниже: Query returned successfully, если нет, то перезапустите php8.2-fpm`

После перезапускам nginx и автозагрузка:

`systemctl enable --now php8.2-fpm nginx`
