# Contenedores de Sistemas de Base de Datos

![ImagenDocker](./img/docker-image.png)

## Imagenes 


> Comandos para cada imagen

- Descargar Imagen de PostGres

```
docker pull postgres:14.22-trixie
```

- Descargar imagen de tutorial de Docker

```
docker pull docker/getting-started
```


## Creación de contenedores

```
docker run -d -p 80:80 **nombre o codigo de la imagen**
```
Donde
- -d detach (background)
- -p puerto (el primer número de puerto no se cambia, el segundo si podemos cambiarlo)
### Contenedor de Tutorial de Docker
> docker run -d -p 80:80 docker/getting-started

> docker run -d -p 80:8081 d7933

### Contenedor de mariaDB sin volumen
```
docker run -d --name Server-MariadbG1 
-p 3343:3306 -e MARIADB_ROOT_PASSWORD=123456  e0236f
```
### Contenedor de MariaDb con volumen
```
docker volume create v-mariadbg1
docker run -d --name Server-MariadbG1 -p 3343:3306 -e MARIADB_ROOT_PASSWORD=123456 -v v-mariadbg1:/var/lib/mysql e0236f
```
### Contenedor de Postgres con volumen
```
docker volume create v-postgresG1
docker run -d --name Server-PostgresG1 -p 5455:5432 \
-e POSTGRES_PASSWORD=123456 \
-v v-postgresG1:/var/lib/postgresql/data \
bbb88
```

### Contenedor de SQL Server con volumen
```
docker volume create v-sqlServerG1
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssw0rd" \
   -u 0 \
   -p 1450:1433 --name SQLServerG1 \
   -d -v v-sqlServerg1:/var/opt/mssql/data \
   d01cc4
```

## Comandos

| Comando | Descripción |
| :--- | :--- |
| **docker --version** | _Muestra la versión del Docker_ |
| **docker pull nombre_imagen** | _Nos sirve para descargar una imagen de docker hub_ [Docker Hub(https://hub.docker.com/) |
|**docker images**|_Muestra todas las imagenes_|
|**docker run**|_Permite crear un contenedor_|
|**docker ps**|_Visualiza los contenedores que estan en ejecución_|
|**docker container ls**|_Visualiza los contenedores que estan en ejecución_|
|**docker ps -a**|_Visualiza los contenedores que estan en ejecución y sin iniciar_|
|**docker container ls -a**|_Visualiza los contenedores que estan en ejecución y sin iniciar_|
|**docker run**|_Elimina un contenedor abajo_|
|**docker run**|_docker run -d --name server-MariadbG1 -p 3343:3306_|
|**docker stop nombre o ID**|_Detiene el contenedor_|
|**docker start nombre o ID**|_Inicia un contenedor_|
|**docker rm nombre o ID**|_Elimina un contenedor que no esta en ejecución_|
|**docker rm -f nombre o ID**|_Elimina un contenedor que esta en ejecución_|
|**Mayores Privilegios**|_MariaDB = root, Postgres = postgres, SQL server = sa(Super Admin)_|
|**docker volume ls**|_Muestra los volumenes que existen en docker_|

