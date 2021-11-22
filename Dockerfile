FROM ubuntu:latest

RUN apt-get update && apt-get -y install \
  curl \
  expect

RUN mkdir /fah
RUN curl -fL 'https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-arm64/v7.6/fahclient_7.6.21_arm64.deb' > /fah/fahclient.deb
ADD install-fah-with-expect /fah
RUN expect install-fah-with-expect

EXPOSE 7396
CMD FAHClient --config /etc/fahclient/config.xml
