{
"Dhcp4": {
  "interfaces-config": {
    "interfaces": [ "eth0" ]
  },
  "option-data": [ {
    "name": "domain-name-servers",
    "data": "8.8.8.8, 8.8.4.4"
  } ],
  "subnet4": [ {
    "subnet": "192.168.1.0/24",
    "pools": [ { "pool": "192.168.1.100 - 192.168.1.200" } ],
    "option-data": [ {
      "name": "routers",
      "data": "192.168.1.1"
    }
},
{
"subnet": "10.0.0.0/24",
"pools": [
{
"pool": "10.0.0.100 - 10.0.0.200"
}
],
"option-data": [
{
"name": "routers",
"data": "10.0.0.1"
}
]
}
]
}
}
