FROM ubuntu:latest

WORKDIR /app

RUN apt-get update && apt-get -y install \
  curl \
  expect

RUN curl -fL 'https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-arm64/v7.6/fahclient_7.6.21_arm64.deb' > /app/fahclient.deb
ADD install-fah-with-expect .
RUN expect install-fah-with-expect

EXPOSE 7396
CMD FAHClient --config /app/config.xml
