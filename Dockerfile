# Paso 1: Se comienza apartir de una imagen de ubuntu 18
FROM ubuntu:bionic
# Paso 2: Se configura la variable de entorno HOME, donde colocaremos los archivos que descarguemos
ENV HOME=/prometheus
# Paso 3: Definimos en que carpeta estaremos trabajando
WORKDIR /prometheus
# Paso 4: Actualizamos los repositorios de ubuntu e instalamos wget
RUN apt update && apt install wget -y
# descargamos el comprimido de Prometheus
RUN wget https://github.com/prometheus/prometheus/releases/download/v2.8.0/prometheus-2.8.0.linux-amd64.tar.gz
# DEscomprimimos el tar y copiamos todo el contenido a nuestra carpeta de trabajo /prometheus
RUN tar -xzf prometheus-2.8.0.linux-amd64.tar.gz -C . --strip-components 1
# Eliminamos el archivo prometheus.yml que viene por defecto
RUN rm prometheus.yml
# Copiamos dentro del contenedor el archivo de configuracion que nosotros deseamos ejecutar
COPY prometheus.yml .
# Exponemos el Puerto donde corre prometheus
EXPOSE 9090
# Declaramos el comando que se ejecutara cuando levantemos el contenedor.
CMD ["./prometheus"]
