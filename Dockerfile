FROM alpine:latest

RUN apk add --no-cache ca-certificates curl unzip \
 && curl -L -o /v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
 && unzip /v2ray.zip -d /usr/bin/v2ray \
 && rm /v2ray.zip \
 && chmod +x /usr/bin/v2ray/v2ray

ADD config.json /etc/v2ray/config.json

EXPOSE 8080

CMD ["/usr/bin/v2ray/v2ray", "-config=/etc/v2ray/config.json"]
