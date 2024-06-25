Сертификат от корпоративного CA FreeIPA

![](cert1.png)
![](cert2.png)

На рабочем клиенте:

```bash
certutil -D -n /opt/pki
certutil -R -d /opt/pki -a -g 2048 -s 'CN=web.test.local,O=TEST.LOCAL' -8 'web.test.local' # -8 - subjectAltName Может быть много SAN`ов
```
При создании сертификата учитывайте параметры SAN (subjectAltName), их может быть очень много. А также AuthType
Экспорт из NSS Базы данных в RAW формат

```bash
pk12util -d . -r -n web-test-local -o bundle.p12 # -n - alias
openssl pkcs12 -in bundle.p12 -out web.crt -clcerts -nokeys
openssl pkcs12 -in bundle.p12 -out web.key -nocerts -nodes
```
