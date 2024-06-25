Короче, нужно скачать несколько пакетов

`apt-get install docker-engine docker-compose python3-module-dockerpty'

Обязательно запустить 

`systemctl enable --now docker`

После команды compose лучше делать так:

`docker compose up -d` - то есть без "-" в команде
