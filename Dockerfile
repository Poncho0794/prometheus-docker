FROM ubuntu:bionic

ENV HOME=/prometheus

WORKDIR /prometheus

RUN apt update && apt install wget -y



RUN wget https://github.com/prometheus/prometheus/releases/download/v2.8.0/prometheus-2.8.0.linux-amd64.tar.gz

RUN tar -xzf prometheus-2.8.0.linux-amd64.tar.gz -C . --strip-components 1

RUN rm prometheus.yml

COPY prometheus.yml .

RUN cat prometheus.yml

EXPOSE 9090

CMD ["./prometheus"]
