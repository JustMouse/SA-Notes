Всё намного проще чем кажется. Поехали:

`apt-get update -y; apt-get install pip -y`

На сайте pgadmin4 находим https://www.pgadmin.org/download/pgadmin-4-python/

Сборку pgadmin4 на питоне. Скопируйте ссылку, вставьте в браузер, найдите whl-файл и качаем оттуда whl файл

`pip install https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v8.8/pip/pgadmin4-8.8-py3-none-any.whl`

Качаем доп. пакеты для запуска

`apt-get install python3-module-pkg_resources -y`

`apt-get install python3-modules-sqlte3 # Тут коварная “s”`

Если забыли то `apt-cache search <Что-то что надо найти>`

`/etc/init.d/postgresql initdb`

Меняем параметры для pgadmin4 вот так

`nano /usr/local/lib/python3/site-packages/pgadmin4/config.py`

``bash
DEFAULT_SERVER = `100.99.90.101`
DEFAULT_SERVER_PORT = 8000
``

Запускаем pgadmin4

`pgadmin4`

Вводим Email и пароль

После этого можно закинуть pgadmin4 в автозапуск

Подключаем к базе данных

`Registed > Connection: localhost, Username postgres`

И пользователя

`Create user > General: name > Privileges: Can login?: YES`

Создаём БД где ownder (владелец) пользователь
