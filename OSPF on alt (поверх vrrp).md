```python
user@alt apt-get install frr
user@alt nano /etc/frr/daemons
...
ospfd = yes
...
user@alt systemctl enable --now frr
user@alt systemctl restart frr
user@alt vtysh
R2-KLG conf t
R2-KLG router ospf
R2-KLG network 192.168.1.0/29 area 0
R2-KLG network 192.168.10.0/24 area 0
R2-KLG network 192.168.11.0/24 area 0
R2-KLG network 192.168.12.0/24 area 0
R2-KLG network 192.168.13.0/24 area 0
R2-KLG ospf router-id 192.168.1.2
R2-KLG ex
R2-KLG interface ens4.2011 # ТАК ДЕЛАЕМ НА ВСЕ VLAN
R2-KLG ip ospf passive
R2-KLG interface ens3
R2-KLG ip ospf priority 2 # ЭТО ДЛЯ ПРИОРИТЕТА
```

```python
user@alt apt-get install frr
user@alt nano /etc/frr/daemons
...
ospfd = yes
...
user@alt systemctl enable --now frr
user@alt systemctl restart frr
user@alt vtysh
R3-KLG conf t
R3-KLG router ospf
R3-KLG network 192.168.1.0/29 area 0
R3-KLG network 192.168.10.0/24 area 0
R3-KLG network 192.168.11.0/24 area 0
R3-KLG network 192.168.12.0/24 area 0
R3-KLG network 192.168.13.0/24 area 0
R3-KLG ospf router-id 192.168.1.3
R3-KLG ex
R3-KLG interface ens4.2011 # ТАК ДЕЛАЕМ НА ВСЕ VLAN
R3-KLG ip ospf passive
```