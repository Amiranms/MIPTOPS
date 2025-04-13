FROM alpine:latest

RUN apk update && apk add --no-cache bash libcap
RUN apk add nginx
RUN apk add vim

RUN adduser -D testuser
RUN setcap 'cap_net_bind_service=+ep' /usr/sbin/nginx

COPY serverspace/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /usr/share/nginx/html \
    /var/lib/nginx/logs \
    /var/lib/nginx/tmp/client_body \
    /var/log/nginx \
    /var/run && \
    chown -R testuser:testuser /usr/share/nginx/html /var/lib/nginx /var/log/nginx /var/run

EXPOSE 80

USER testuser

CMD ["nginx", "-g", "daemon off;"]
