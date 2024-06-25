Как скачали [Docker](docker.md) можно переходить к тикет приколам

Качем гит:

`apt-get install git -y`

После качаем репу куда надо

`cd /opt/`
`git clone https://github.com/zammad/zammad-docker-compose.git`

Заходим внутрь

`cd zammad-docker-compose`

Меняем параметры внутри docker-compose.yml на те, что нужны по заданию

`nano docker-compose.yml`

По сути тут только требуется изменения для nginx контейнера, думаю, что будет правильно смонтировать дополнительно volume внутри файла и перекинуть туда сертификаты и conf файлы для nginx

И поднимаем

`docker-compose up -d`

И типо всё!!! Можно зайти на сервер по порту 8080 через браузер.

Учтите, что минимум 3 ГБ и 3 Ядра нужно
