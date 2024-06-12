FROM ubuntu:latest

WORKDIR /app

COPY . /app

RUN apt-get update && \
    apt-get install -y fortune-mod cowsay bash && \
    chmod +x wisecow.sh

EXPOSE 4499

CMD ["./wisecow.sh"]
