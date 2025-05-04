FROM system AS builder


COPY . / 

RUN g++ hello-world.cpp -o /bin/print_hello

RUN mkdir build && cd build && cmake .. && make