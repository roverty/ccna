# CCNA v7

## Módulo 1

> TODO:
>
> * [x] [PROGRESS] Cheatsheet de comandos básicos para router y switch
>
> * [ ] [PENDIENT] Resumen de la currícula
>
> * [ ] [PENDIENT] Resumen del contenido de los vídeos
>
> *Esta card se eliminará cuando se concluyan todas las tareas*

### Cheatsheet

**Nomenclatura**

* M-N: Modo normal
* M-P: Modo privilegiado
* M-CG: Modo configuración global

En caso de que no se especifique, el modo será: modo configuración global ya que es el más común

Los siguientes comandos funcionan para dispostivos router o switch, en caso contrario se espefíca

```sh 
# Entrar a modo privilegiado
enable
en
# Entrar a modo configuracion global
configure terminal
conf t
# M-P: Mostrar la version
show version
# M-P: Mostar la configuracion del dispositivo
show running config
sh r

####################################################
# M-CG: Configurar hostname
hostname <NOMBRE>

# M-CG: Configurar contraseña al enable de tipo 7
enable password <CONSTRASENA>
# M-CG: Configurar contraseña al enable de tipo 5
enable secret <CONSTRASENA>
# M-CG: Activar la encriptacion de contrasenas
service password-encryption

###################################################
# crear un usuario con contraseña de tipo 5
username <NOMBRE> secret <CONTRASENA>

# Se configura la autentificacion de un modo primitivo
line console 0
login local

# La configuracion que más sirve es habilitar lineas virtuales
line vty 0 15
login local

###################################################
########## 		SSH configuracion			#######
###################################################
ip domain name <NOMBRE>
crypto key generate rsa
ip ssh authentification-retries 2
ip ssh time-out 60
# Se habilita modelo de seguridad aaa
aaa new-model

line vty 0 15
# Se habilita shh con transport
# No se puede puede ocupcar login local por el modelo
# de seguridad aaa
transport input ssh

###################################################
#####		Guardar configuracion 			#######
###################################################
# M-P: Primera forma
copy running-config startup-config
# M-P: Segunda forma
write
wr
# M-P: Reiniciar dispostivo 
# (no es necesario, pero si es útil)
reload

###################################################
###### 			Configuración de IPv4 		#######
###################################################
# Configuracion para switch
interface vlan 1
ip address <IP> <MASCARA>
no shutdown

# Configuracion para router
# Sintaxis: interface <fastEhernet|gigabitEthernet> <INTERFAZ>
interface gigabitEthernet 0/0/0
ip address <IP> <MASCARA>
no shutdown

# M-P: Mostar interfaces y sus ips configuradas
show ip interface brief

# M-P: Para ver más detalle de una interfaz
show ip interface GigabitEthernet 0/0/0
show interfaces GigabitEthernet 0/0/0

###################################################
# M-P: Ver tabla mac
show mac-address-table
# M-P: Limpiar la tabla mac
clear mac-address-table

###################################################
###### 			Configuración de IPv6 		#######
###### 		con direccionamiento estático	#######
###################################################
# Activar ipv6
ipv6 unicast-routing
interface gi0/0/0
ipv5 address 2001::DB8:CAFE:1::1/64
no shutdown

###################################################
###### 			Configuración de IPv6 		#######
###### 		con direccionamiento EUI-64		#######
###################################################
# Activar ipv6
ipv6 unicast-routing
interface gi0/0/0
# El único cambio es que se agrega eui-64 al final
ipv5 address 2001::DB8:CAFE:1::1/64 eui-64
no shutdown

###################################################
###### 			Enrutamiento por RIP 		#######
###################################################
router rip
version 2
# Se listan las redes que estan directamente conectadas
# cada una se da de dalta por medio del sig. comando
network <IP>
# Ver la tabla de enrutamiento
show ip route

###################################################
#### Configuración de router como DHCP y DNS ######
###################################################
ip dhcp pool <NOMBREPOOL>
# Dar de alta la red 
network <IP> <MASCARA>
# Configuración de default gateway
default-router 192.168.1.254
dns-server <IP>
# Excluir direcciones ya asignadas
ip dhcp excluded-address 192.168.1.254

# Mostrar ips asignadas
show ip dhcp binding
# Mostar ips disponibles
show ip dhcp pool

# ¿Como agregamos default gateway a un switch
# Previamente se tiene que tener una IP
ip default-gateway <IP>

###################################################
###### 	CDP (Cisco Discovery Protocol) 		#######
###################################################
# Ver los dispositivos que tenemos conectados directamente
show cdp neighbors
# Desactivar cdp
no cdp run
# Un procolo similar a cdp es lldp
# Se recomienda tenerlo desactivado
no lldp run
```

En resumen, los `show` más importantes son:

```sh
show version
show running config

show ip interface brief
show ip interface GigabitEthernet 0/0/0
show interfaces GigabitEthernet 0/0/0

show mac-address-table

show ip route

show ip dhcp binding
show ip dhcp pool

show cdp neighbors
```

