Сертификат от корпоративного CA FreeIPA

![](cert1.png)

На самом скриншоте есть гайд по пунктам

![](cert2.png)

На рабочем клиенте:

Если нет certutil:

`apt-get install nss-utils -y`

```bash
certutil -D -n /opt/pki
certutil -R -d /opt/pki -a -g 2048 -s 'CN=web.test.local,O=TEST.LOCAL' -8 'web.test.local' # -8 - subjectAltName Может быть много SAN`ов
```
При создании сертификата учитывайте параметры SAN (subjectAltName), флаг `-8` их может быть очень много. А также AuthType
Экспорт из NSS Базы данных в RAW формат

Также обратите внимание, можно использовать другие флаги для keyUsage

`-6`, например `-6 serverAuth`

А также, обозначить, что это сертификат сервера

`-5`, например `-5 sslServer`

Обычная такое используется для интерфейсов серверов и маршрутизаторов

```bash
pk12util -d . -r -n web-test-local -o bundle.p12 # -n - alias
openssl pkcs12 -in bundle.p12 -out web.crt -clcerts -nokeys
openssl pkcs12 -in bundle.p12 -out web.key -nocerts -nodes
```
