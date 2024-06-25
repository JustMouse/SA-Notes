
DNS между филиалами 
В freeipa заходим на SRV-KLG
(Сетевые службы->DNS->зоны перенаправления) 
{Создаём зону 
rzn.jun.profi
Перенаправители зон: 192.168.20.1; 10.0.0.1}
Идём в зоны DNS;
Добавляем ip-сеть обратной зоны всей сети rzn
Потом 
nano /etc/named.conf
Ищем путь /etc/bind/ipa-options-ext.conf
И пишем 
Dnssec-validation no;
Allow-query { any; };
Allow-recursion { any; };
Allow-transfer { any; };
**На opnsense** 
В srvices-> bind -> Configuration
DNS forwarders 192.168.11.100 100.100.100.100