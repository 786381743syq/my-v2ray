FROM alpine:latest

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && curl -L -H "Cache-Control: no-cache" -o /v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
 && mkdir /usr/bin/v2ray /etc/v2ray \
 && unzip /v2ray.zip -d /usr/bin/v2ray \
 && rm -rf /v2ray.zip /usr/bin/v2ray/*.sig /usr/bin/v2ray/doc /usr/bin/v2ray/*.json /usr/bin/v2ray/*.dat /usr/bin/v2ray/sys* \
 && chmod +x /usr/bin/v2ray/*

ADD config.json /etc/v2ray/config.json

CMD /usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json
