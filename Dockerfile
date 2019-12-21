FROM debian:buster-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        libtool \
        libssl-dev \
        automake \
        pkg-config \
        autoconf && \
        rm -rf /var/lib/apt/lists/* 

COPY . /btcdeb
WORKDIR /btcdeb

RUN sh autogen.sh && \
    sh configure && \
    make && \
    make install
