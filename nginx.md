Конфигурационный файл:

```bash
server {
  listen 80 default_server;
  return 404;
}
server {
  listen 443 ssl default_server;
  ssl_certificate /opt/web.crt;
  ssl_certificate_key /opt/web.key;
  return 404;
}
server {
  listen 443 ssl;
  server_name web.test.local;
  ssl_certificate /opt/web.crt;
  ssl_certificate_key /opt.web.key;
# === Без php ===
  location / { }
# === Конец ===
# === Если конфиг использует php ===
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
# === Конец ===
  index index.php index.html;
  root /var/www/html;
}

server {
  listen 80;
  server_name web.test.local;
  index index.php index.html;
  root /var/www/html;
  return 301 https://web.test.local;
  location / { }
}
```
