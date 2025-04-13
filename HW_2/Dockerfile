FROM golang:alpine

WORKDIR /app

RUN apk update && apk add --no-cache libcap npm make git gettext

COPY ./listmonk ./listmonk

RUN cd listmonk/frontend && \
    rm -rf package-lock.json node_modules && \
    npm install && \
    npm run build && \
    cd ../ && \
    make

COPY ./config.toml /app/listmonk/config.tmpl

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

RUN ls -la listmonk
RUN chmod 755 /app/listmonk/listmonk 

RUN adduser -D listmonk && chown -R listmonk:listmonk /app

EXPOSE 9000

USER listmonk

ENTRYPOINT [ "/app/entrypoint.sh" ]
CMD [ "/app/listmonk/listmonk" ]
