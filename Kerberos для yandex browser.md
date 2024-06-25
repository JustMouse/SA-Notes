1. Надо скачать сертификат (если правильно скачивали freeipa то они будут загружены)
2. Создаем папку
```bash
mkdir -p /etc/opt/yandex/browser/policies/managed/
```
3. Создаем файл mydomain.json
```bash
touch mydomain.json
```
4. Делаем конфиг внутри
```json
{
"AuthServerAllowlist": "*.domain",
"AuthNegotiateDelegateAllowlist": "*.domain"
}
```
5.  Даем для папки chmod
```bash
chmod 755 /etc/opt/ -R
```
6. Перезагружаем yandex browser
7. Заходим в компьютер под пользователем admin!!!