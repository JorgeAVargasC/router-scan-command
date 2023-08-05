# Router Scan Project

Breve descripción del proyecto.

## Índice

- [Router Scan Project](#router-scan-project)
  - [Índice](#índice)
  - [Requerimientos](#requerimientos)
  - [Instalación](#instalación)
  - [Uso](#uso)
  - [Contribución](#contribución)
  - [Créditos](#créditos)
  - [Licencia](#licencia)
  - [Contacto](#contacto)

## Requerimientos

- [Raspberry PI Imager](https://www.raspberrypi.com/software/)
- [Kali Linux ARM](https://www.kali.org/get-kali/#kali-arm)
- [Raspberry Pi 3](https://www.raspberrypi.org/products/raspberry-pi-3-model-b/)
- [Memoria micro SD configurada con Kali Linux ARM](https://www.youtube.com/watch?v=6gDRQ1DqHM4) 
  (Memoria mínima de 16GB)

## Instalación

- Configurar la memoria micro SD con Kali Linux ARM
- Conectar la memoria micro SD a la Raspberry Pi 3
- Conectar la Raspberry Pi 3 a la corriente
- Conectar la Raspberry Pi 3 a la red
- Conectar la Raspberry Pi 3 a un monitor
- Conectar un teclado a la Raspberry Pi 3
- Conectar un mouse a la Raspberry Pi 3
- Iniciar sesión con el usuario `kali` y la contraseña `kali`
- Abrir una terminal
- Actualizar el listado de paquetes disponibles

```bash
sudo apt update
```
- Clonar el repositorio en la ruta `/home/kali`

```bash
cd /home/kali
git clone https://github.com/JorgeAVargasC/router-scan-command
```

- Ejecutar el script `kali.sh`, encargado de automatizar la instalación y configuración de varias herramientas y servicios en el sistema

```bash
sudo sh router-scan-command/deploy/kali.sh
```

- Remover el inicio de sesión de la Raspberry Pi 3

```bash
sudo raspi-config
```
- Pasos
  - Boot Options
  - Desktop / CLI
  - Desktop Autologin
  - Ok and Finish

- Reiniciar la Raspberry Pi 3

```bash
sudo reboot
```

## Uso

Explica cómo utilizar tu proyecto si es necesario. Puedes proporcionar ejemplos de código y capturas de pantalla.

## Contribución

Si aceptas contribuciones de otros desarrolladores, explica cómo pueden colaborar. Puedes mencionar pautas de estilo de código, proceso de envío de solicitudes de extracción, etc.

## Créditos

Agradece aquí a las personas o proyectos que han contribuido directamente a tu proyecto.

## Licencia

Indica la licencia bajo la cual se distribuye el proyecto. Puedes utilizar un enlace a un archivo `LICENSE` para obtener más detalles.

## Contacto

Proporciona información de contacto para que los usuarios puedan comunicarse contigo si tienen preguntas o problemas relacionados con el proyecto.
