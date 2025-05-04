FROM alpine:3.21

RUN apk update && apk add --no-cache bash \
                                     git \
                                    build-base \
                                    cmake \
                                    vim \
                                    musl-dev \
                                    libffi-dev \
                                    python3-dev \
                                    py3-pip \
                                    which
COPY . /

RUN python3 -m venv /venv

RUN /venv/bin/pip install --no-cache-dir -r requirements.txt
