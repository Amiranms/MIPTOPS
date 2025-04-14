FROM golang:alpine AS builder 

WORKDIR /build

RUN apk update && apk add --no-cache libcap npm make git gettext

COPY ./listmonk ./listmonk

RUN cd listmonk/frontend && \
    rm -rf package-lock.json node_modules && \
    npm install && \
    npm run build && \
    cd ../ && \
    make

COPY ./config.toml /build/listmonk/config.tmpl

COPY entrypoint.sh /build/entrypoint.sh
RUN chmod +x /build/entrypoint.sh

RUN chmod 755 /build/listmonk/listmonk 

RUN adduser -D listmonk && chown -R listmonk:listmonk /build


USER listmonk




FROM alpine:3.21

WORKDIR /app 

RUN apk update && apk add --no-cache gettext


COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

COPY ./config.toml /app/listmonk/config.tmpl

# COPY --from=builder /build/listmonk/config.toml /app/listmonk/config.toml
COPY --from=builder /build/listmonk/listmonk /app/listmonk/listmonk
COPY --from=builder /build/listmonk/static  /app/listmonk/static
COPY --from=builder /build/listmonk/config.toml.sample /app/listmonk/config.toml.sample
COPY --from=builder /build/listmonk/queries.sql /app/listmonk/queries.sql
COPY --from=builder /build/listmonk/schema.sql /app/listmonk/schema.sql
COPY --from=builder /build/listmonk/permissions.json /app/listmonk/permissions.json
COPY --from=builder /build/listmonk/frontend /app/listmonk/frontend
COPY --from=builder /build/listmonk/i18n /app/listmonk/i18n

EXPOSE 9000

ENTRYPOINT [ "/app/entrypoint.sh" ]
CMD ["/app/listmonk/listmonk"]


