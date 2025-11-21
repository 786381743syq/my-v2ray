FROM teddysun/xray:latest

COPY config.json /etc/xray/config.json

EXPOSE 8080

CMD ["xray", "-c", "/etc/xray/config.json"]
