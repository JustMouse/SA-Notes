```python
iptables -P INPUT DROP #блочим все исходящие
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT # разрещаем для пингов других, а они нас не могут
nslookup pro.firpo.ru
iptables -P OUTPUT DROP #блочим все входящие
iptables -A OUTPUT -d 192.168.0.0/16 -j ACCEPT #разрешаем пинговать локальную сеть
iptables -A OUTPUT -d 83.237.0.226 -j ACCEPT # разрешаем пинговать айпи адрес pro.firpo.ru
#таким же образом разрешаем все остальные пинги
#они не могут нас пинговать, но мы можем их
```
