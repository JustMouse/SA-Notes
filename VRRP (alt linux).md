**Это мы делаем на R2-KLG тоесть главный**
```python
user@alt apt-get install keepalived
user@alt nano /etc/keepalived/keeaplive.conf
...
vrrp_instance {NAME} {
	state MASTER
	interface ens3 # для других ставим ens4.2010
	virtual_router_id 1 # тут мы должны указать vlan либо 1 если в сторону fw
	priority 100 # чем выше приоритет тем главнее
	advert_int 1 # хз что такое, но ставим 
	virtual_ipaddress {
	192.168.1.4/29 # виртуальный айпи, либо такой, либо 
	}
}
# Дальше мы повторяем тоже самое только меняя параметры

...

```
**Это делаем на R3-KLG тоесть не главный**
Обязательно указываем приоритет 99, и в state BACKUP
```python
user@alt apt-get install keepalived
user@alt nano /etc/keepalived/keeaplive.conf
...
vrrp_instance {NAME} {
	state BACKUP
	interface ens3 # для других ставим ens4.2010
	virtual_router_id 1 # тут мы должны указать vlan либо 1 если в сторону fw
	priority 99 # чем выше приоритет тем главнее 
	advert_int 1 # хз что такое, но ставим 
	virtual_ipaddress {
	192.168.1.4/29 # виртуальный айпи, либо такой, либо 
	}
}

```
