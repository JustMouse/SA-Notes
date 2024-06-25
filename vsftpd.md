Установить пакеты:

`apt-get install vsftpd anonftp`

Сделать изменения в файле /etc/xinetd.d/vsftpd

`disable   = no      #включает сервис`

`Проверить глобальные настройки xinetd в файле /etc/xinetd.conf, обратить внимание (возможно закомментировать) на строку`

`only_from = 0.0.0.0`

В файле /etc/vsftpd.conf

```bash
seccomp_sandbox=NO
allow_writeable_chroot=YES
anonymous_enable=NO
local_enable=YES
write_enalbe=YES
local_umask=077
chroot_local_user=YES
# И ещё по умолчанию строки
```

Указать корректную домашнюю директорию пользователя

```usermod -d /to/path <user>```

Дать корректные права на домашнюю директорию пользователя, который подключатся по ftp

Перезапустить сервис

`service xinetd restart` ИЛИ `systemctl restart xinetd`

Установить запуск сервиса xinetd при загрузке системы

`chkconfig xinetd on` ИЛИ `systemctl enable --now xinetd`
