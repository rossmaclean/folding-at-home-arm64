FROM ubuntu:latest

WORKDIR /app

RUN apt-get update && apt-get -y install \
  curl \
  expect

RUN mkdir fah
RUN curl -fL 'https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-arm64/v7.6/fahclient_7.6.21_arm64.deb' > /app/fah/fahclient.deb
ADD install-fah-with-expect fah
RUN cd fah
RUN expect fah/install-fah-with-expect

EXPOSE 7396
CMD FAHClient --config /etc/fahclient/config.xml
