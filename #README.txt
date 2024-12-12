# Proyecto Java Rehobot 

Este documento describe los pasos necesarios para configurar el entorno de desarrollo requerido para trabajar en este proyecto Java.

## Requisitos previos

Antes de comenzar, asegúrate de tener instalados los siguientes elementos:

1. **NetBeans**
2. **JDK 20**
3. **Apache Tomcat 10.1.34**
4. **XAMPP 8.2.12**
5. **MySQL Connector/J (MySQL 8.0.33 JAR Driver)**

---

## Pasos para la instalación

### 1. Instalar NetBeans
1. Descarga la última versión de NetBeans desde el sitio oficial: [NetBeans](https://netbeans.apache.org/).
2. Ejecuta el instalador y sigue las instrucciones en pantalla.

### 2. Instalar JDK 20
1. Descarga JDK 20 desde el sitio oficial de Oracle: [JDK 20](https://www.oracle.com/java/technologies/javase-jdk20-downloads.html).
2. Instala JDK 20 siguiendo las instrucciones del instalador.

### 3. Instalar Apache Tomcat 10.1.34
1. Descarga Apache Tomcat 10.1.34 desde el sitio oficial: [Apache Tomcat](https://tomcat.apache.org/).
2. Extrae el archivo descargado en un directorio de tu elección.
3. Configura el servidor Tomcat en NetBeans:
   - Ve a **Servicios** en NetBeans.
   - Haz clic derecho en **Servidores** y selecciona **Agregar servidor**.
   - Selecciona **Apache Tomcat** e indica la ubicación donde lo instalaste.

### 4. Instalar XAMPP 8.2.12
1. Descarga XAMPP 8.2.12 desde el sitio oficial: [XAMPP](https://www.apachefriends.org/index.html).
2. Ejecuta el instalador y sigue las instrucciones.
3. Asegúrate de iniciar los servicios de Apache y MySQL desde el Panel de Control de XAMPP.

### 5. Descargar MySQL Connector/J (MySQL 8.0.33 JAR Driver)
1. Descarga el archivo JAR correspondiente desde el sitio oficial: [MySQL Connector/J](https://dev.mysql.com/downloads/connector/j/).
2. Coloca el archivo JAR en la carpeta `lib` de tu proyecto en NetBeans.
3. Agrega el JAR:
   - Ve a **Servicios** en NetBeans 
   - Selecciona **Databases** > **Nueva Conexion** > **Driver /MySQL (Connector/J driver)**.
   - Navega hasta el archivo descargado y añádelo.

