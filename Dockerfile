FROM microsoft/aspnet:latest

WORKDIR /.bootstrap

RUN apt-get update && \
    apt-get install -y cmake nasm wget git && \
    wget https://github.com/libgd/libgd/releases/download/gd-2.1.1/libgd-2.1.1.tar.gz && \
    tar -xvzf libgd-2.1.1.tar.gz

RUN apt-get install -y g++

RUN cd libgd-2.1.1 && \
    ./thumbs.sh make || true && \
    ./configure && \
    make && \
    make install

RUN find /usr/lib . | grep libgd.*\.so
