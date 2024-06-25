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

И поднимаем

`docker compose up -d`

И типо всё!!!
