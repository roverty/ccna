# CCNA v7

## Módulo 1

### Cheatsheet

**Nomenclatura**

* M-N: Modo usuario
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
#	 		SSH configuracion			
###################################################
# Previamente se debe configurar el hostname
# y un usuario de OS
# y una ip
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
# 			Guardar configuracion 	
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
#	 			Configuración de IPv4 
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
#	 			Configuración de IPv6 	
#	 		con direccionamiento estático	
###################################################
# Activar ipv6
ipv6 unicast-routing
interface gi0/0/0
ipv5 address 2001::DB8:CAFE:1::1/64
no shutdown

###################################################
# 			Configuración de IPv6 		
#		con direccionamiento EUI-64		
###################################################
# Activar ipv6
ipv6 unicast-routing
interface gi0/0/0
# El único cambio es que se agrega eui-64 al final
ipv5 address 2001::DB8:CAFE:1::1/64 eui-64
no shutdown

###################################################
#	 			Enrutamiento por RIP 	
###################################################
router rip
version 2
# Se listan las redes que estan directamente conectadas
# cada una se da de dalta por medio del sig. comando
network <IP>
# Ver la tabla de enrutamiento
show ip route

###################################################
#	 Configuración de router como DHCP y DNS 
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
#		 CDP (Cisco Discovery Protocol) 		
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

### Lista de conceptos

1. Red de datos
   1. LAN
   2. WAN
2. Internet
   1. Extranet
   2. Intranet
3. Arquitectura de una red
4. Modelo OSI
5. Modelo TCP/IP
6. CSMA / CD
7. Hub vs Switch
8. Half duplex
9. Full duplex
10. Colisión
11. Dominio de colisión
12. Dominio broadcast
13. Suite de protocolos
14. Stack de protocolos
15. Tipos de mensaje
16. FastEthernet
17. GigabitEthernet
18. Cables
19. ARP
20. ICMP
21. Admin de dispostivios CISCO
22. Servidor
23. Cliente
24. Arquitectura entre pares
25. Socket
26. IPV4
27. IP de clase
28. IPs privadas
29. VLSM
30. IPv6
31. Tiposs de direcciones ipv6
32. EUI - 64
33. Sintetizar direcciones IPV6
34. Tipos de enrutamiento
35. Red conectada directamente
36. Redes remotas
37. RIP
38. Defult Gateway
39. TCP
40. Protocolos de TCP
41. UDP
42. Procolos UDP
43. DHCP
44. SMTP
45. MUA
46. MTA
47. POP
48. IMAP
49. CDP
50. LLDP

### Topología para el feedback

- [x] Colocar los hostname indicados a cada router y cada switch de la topología (0.83pts)
- [x] Habilitar SSH y TELNET en todos los routers. (0.83pts)
- [x] Habilitar telnet en todos los switches. (0.83pts)
- [x] Configurar servidor de correo. (0.83pts)
- [x] Configurar y cargar archivos al servidor FTP, descargar ese archivo en algún host. Especificar en cual se hizo esta prueba a la hora de enviar el entregable. (0.83pts)
- [x] Entregar cálculos del VLSM. (0.83pts)
- [x] Enrutar con RIPv2. (0.83pts)
- [x] Configurar servidor web y DNS. (0.83pts)
- [x] Configurar DHCP en routers de los segmentos A, B y D. (0.83pts)
- [x] Telnet de S0 a cada uno de los switches (S1,S2,S3,S4,S5,S6). (0.83pts)
- [x] SSH de R0 a todos los demás routers (R1,R2,R3). (0.83pts)
- [x] Telnet de S1 a todos los routers. (0.83pts)