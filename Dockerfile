FROM microsoft/aspnet:latest

COPY . /.bootstrap/
WORKDIR /.bootstrap

RUN apt-get update && \
    apt-get install -y cmake nasm wget git g++ && \

RUN wget https://github.com/libgd/libgd/releases/download/gd-2.1.1/libgd-2.1.1.tar.gz && \
    tar -xvzf libgd-2.1.1.tar.gz && \
    cd libgd-2.1.1 && \
    ./thumbs.sh make || true && \
    cd .. && \
    rm -r libgd-2.1.1

RUN wget http://johnvansickle.com/ffmpeg/releases/ffmpeg-release-64bit-static.tar.xz && \
    mkdir ffmpeg && \
    tar xf ffmpeg-release-64bit-static.tar.xz -C ffmpeg --strip-components=1 && \
    rm ffmpeg-release-64bit-static.tar.xz

RUN dnu restore
