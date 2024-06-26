Сертификат от корпоративного CA FreeIPA

![](cert1.png)

На самом скриншоте есть гайд по пунктам

![](cert2.png)

На рабочем клиенте:

Если нет certutil:

`apt-get install nss-utils -y`

Нужно создать сервис, вместе с А записью до него. Далее сделать сертификат, а Common Name ОБЯЗАТЕЛЬНО должен вести на имя этого сервиса. Если имя узла web.test.local, то и CN такое же

```bash
certutil -D -n /opt/pki
certutil -R -d /opt/pki -a -g 2048 -s 'CN=web.test.local,O=TEST.LOCAL' --extSAN "dns:web.test.local,dns:web,ip:192.168.1.2"
```

Удостоверьтесь, что все SAN сертификаты есть в DNS: IP адреса должны быть в обратной зоне, а все DNS в прямой зоне. Укажие дополнительные псевдонимы

Скопируйте тело CSR и подпишите его.

Далее подпись вертите обратно, скопируйте его и впишите в certutil

`certutil -d nssdb -A -t "P,,"-n "web.test.local" -i web.crt`

Готово, теперь можно вытащить сертификат

При создании сертификата учитывайте параметры SAN (subjectAltName), флаг `-8` их может быть очень много. А также AuthType
Экспорт из NSS Базы данных в RAW формат

Также обратите внимание, можно использовать другие флаги для keyUsage

`-6`, например `-6 serverAuth`

А также, обозначить, что это сертификат сервера

`-5`, например `-5 sslServer`

Обычная такое используется для интерфейсов серверов и маршрутизаторов

```bash
pk12util -d . -r -n web.test.local -o bundle.p12 # -n - alias
openssl pkcs12 -in bundle.p12 -out web.crt -clcerts -nokeys
openssl pkcs12 -in bundle.p12 -out web.key -nocerts -nodes
```

Ваши файлы: web.key - ключ и web.crt - сам сертификат
