FROM alpine:3.21 AS builder

RUN apk update && \
    apk add --no-cache \
      git \
      cmake \
      make \
      g++ \
      jsoncpp-dev \
      pkgconf \
      util-linux-dev \
      zlib-dev \
      hiredis-dev && \
    rm -rf /var/cache/apk/*


COPY drogon /drogon

WORKDIR /drogon

RUN mkdir build && cd build && \
    cmake -D DROGON_BUILD_EXAMPLES=ON .. && \
    make helloworld


FROM alpine:3.21

RUN apk update && \
    apk add --no-cache \
        libstdc++ \
        jsoncpp \
        sqlite-libs \
        hiredis \
        util-linux && \
    rm -rf /var/cache/apk/*


COPY --from=builder /drogon/build/examples/helloworld/ /app/helloworld/

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

EXPOSE 8848


RUN mkdir -p /app/uploads/tmp && \
    chown -R root:root /app/uploads && \
    chmod -R 775 /app/uploads && \
    adduser -D appuser && \
    chown -R appuser:appuser /app

WORKDIR /app


USER appuser


CMD [ "/app/entrypoint.sh" ]
