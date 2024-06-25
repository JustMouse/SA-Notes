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

`systemctl enable --now php8.2-fpm nginx`
