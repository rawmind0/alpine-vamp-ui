FROM rawmind/alpine-nginx:1.10.1-1
MAINTAINER Raul Sanchez <rawmind@gmail.com>

# Compile and install vamp-ui
ENV SERVICE_NAME=vamp-ui \
    SERVICE_VERSION=0.8.4 \
    SERVICE_REPO=https://github.com/magneticio/vamp-ui.git \
    SERVICE_SRC=/opt/src/vamp-ui \
    SERVICE_WWW=/opt/nginx/www

RUN apk add --update nodejs git python make gcc g++ \
  && mkdir -p /opt/src; cd /opt/src \
  && git clone -b "$SERVICE_VERSION" ${SERVICE_REPO} \
  && cd ${SERVICE_SRC} \
  && npm install \
  && npm install gulp \
  && npm i -g gulp \
  && gulp build \
  && cd / && cp -rp ${SERVICE_SRC}/build/* ${SERVICE_WWW} \
  && apk del nodejs git python make gcc g++ \
  && rm -rf /var/cache/apk/* /opt/src 

# Adding files
ADD root /
