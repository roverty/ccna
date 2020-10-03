## Semana 1

**(Clase 2)**

Básicamente para la configuración de **routers** y **switches** tenemos que acceder a su sistemas operativo, el cual para el caso de equipos CISCO es **IOS**. Este sistema tiene 3 modos de operación:

* Modo usuario
  * Es en el que el sistema operativo inicia.
  * El *prompt* es muy simple `router>`
* Modo privilegiado 
  * Para entrar escribimos `enable` (La abreviación es `ena`)
  * Cuando estemos dentro se mostrará `router #` en el *prompt*.
* Modo configuración global
  * Para entrar debemos estar en *modo privilegiado*, escribimos `configure terminal` (La abreviación es `config t`)
  * Cuando estemos dentro se mostrará `router(config) #` en el *prompt*.

El modo "sudo" es el *configuración global*.

**Administración de un equipo CISCO**

* Vía cable consola
  * Vía programas 
    * Putty
    * Teratermin
    * Hyperterminal
    * Minicom (Linux)
* Vía remota
* Cable Auxiliar 

**Iniciando ...**

> TODO: Agregar imágenes
>
> TODO: Escribir teoría

Una vez conectada nuestra computadora al switch  damos doble click a la computadora y después en *desktop* y por último terminal y damos "ok".

Para el caso del router nos preguntará si queremos iniciar con la configuración por defecto, le dicemos que no.

El switch no nos preguntará nada.

### Comandos básico y útiles

La siguiente tabla se irá completando conforme el avance del curso.

| Comando             | Shortcut | Descripción                               | Disponble en modo usuario | Disponible en modo privilegiado | Disponible en modo config. global |
| ------------------- | -------- | ----------------------------------------- | ------------------------- | ------------------------------- | --------------------------------- |
| ?                   |          | Ayuda                                     | Sí                        | Sí                              | Sí                                |
| exit                |          | Salir del modo en el que nos encontremos. | Sí                        | Sí                              | Sí                                |
| show running-config | show run |                                           | No                        | Sí                              | No                                |
| show version        |          |                                           |                           | Sí                              |                                   |

### Mini práctica

1. Cambiar el *hostname*

   * *Modo config. global*

   ```
   hostname RODRIGO
   ```

   > Verifica con `do show running-config`

2. Poner contraseña al modo privilegiado

   * Modo config. global

   Se pone la contraseña en texto plano

   ```
   enable password cisco
   ```

   Salir y volver entrar para verificar

3. Cifrar las contraseñas

   * *Modo config. global*

   Por defecto se cifran con un *tipo 7*

   ```
   service password-encryption
   ```

4. Crear usuario

   * *Modo config. global*

   ```
   username rfrancisco password 123
   ```

   Configuramos para que nos deje autentificarnos con los usuarios que creamos de forma manual

   ```
   line console 0
   login local
   ```

* Para quitar alguna configuración que hallamos puesto se antepone la palabra `no`. Intentemos con el servicio de encriptación

  * *Modo config. global*

  ```
  no service password-encryption
  ```

  Para verificar puede probar creando otro usuario

  Para habilitarlo 

  ```
  service password-encryption
  ```

5. Configuracion contraseñas de *tipo 5 (Hash)*

   * *Modo config. global*

   ```
   username paco secret ccna-gen21
   ```

   Una ayuda

   ```
   username <USERNAME> ?
   ```

6. Configurar una IP

   * *Modo config. global*

   Primero debemos de ver que interfaces tiene nuestro equipo (con `show run`)

   ```
   interface gigabitEthernet 0/0/0
   ```

   Lo anterior nos llevará al *modo configuración de la interfaz* (prompt `router(config)#`)

   ```
   ip address 192.168.1.1 255.255.255.0
   no shutdown
   ```

- Ahora, para un *switch*

  - Asignamos una IP pero a la Vlan

    - *Modo config. global*

    ```
    interface vlan 1
    ```

    Lo anterior nos llevará al *modo configuración de la interfaz* (prompt `Switch(config)#`)

    ```
    ip address 192.168.1.1 255.255.255.0
    no shutdown
    ```

- Guardar y reiniciar

  * Guardar

    * *Modo privilegiado*

    ```
    copy running-config startup-config
    ```

    Otra manera

    ```
    write 
    ```

    La abreviación es `wr`

  * Reiniciar

    ```
    reload
    ```

    

### Uso de `do`

Usamos `do` cuando queramos ejecutar un comando que se encuentra disponible en un nivel de privilegios menor. Por ejemplo:

En modo *config global* queremos tirar un comando de *modo privilegiado*, debemos anteponer la palabra `do`: 

````
do show running-config
````

### Tarea 1

Manden el packet tracer que realizamos en clase, como 

* hostname en router y switch coloquen su nombre. 
* La contraseña de enable, 
* el nombre de usuario y la contraseña del usuario ustedes pueden elegirla, 
  * solo que al mandarlo por correo especifíquenme cuales son esos datos para yo poder verificarlo. 

El correo donde hay que mandarlo 

* jantoniomg1994@gmail.com
* Asunto "práctica 1 ccna gpo1"

**Y cuestionario**