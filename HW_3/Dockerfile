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
    apk add --no-cache libstdc++ && \
    rm -rf /var/cache/apk/*

RUN apk update && \
    apk add --no-cache \
        libstdc++ \
        jsoncpp \
        sqlite-libs \
        hiredis \
        util-linux && \
    rm -rf /var/cache/apk/*

    
COPY --from=builder /drogon/build/examples/helloworld/ /app/helloworld/

EXPOSE 8848

CMD [ "/app/helloworld/helloworld" ]
