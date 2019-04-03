#Prometheus Image

---

## Ejecucion
En el folder del proyecto construir la imagen con `docker build -t prometheus-img .`

Para levantar el contenedor `docker run -d -p 9090:9090 --name=prometheus prometheus-img`

Para detener el contenedor `docker stop prometheus`

Para eliminar el contenedor `docker rm prometheus`
---
## Configuracion

El archivo de `prometheus.yml` es el que se copia dentro de la imagen, si se necesitan archivos
adicionales, se tiene que agregar en el `Dockerfile` y agregar dentro de esta misma carpeta

---
## Acceso

Para entrar a prometheus, ir al navegador y entrar a `http://localhost:9090`
