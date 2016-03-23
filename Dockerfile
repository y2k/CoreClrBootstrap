FROM microsoft/aspnet:latest

RUN apt-get update && \
	apt-get -y cmake nasm && \
	mkdir .bootstrap && \
	cd .bootstrap && \
	wget https://github.com/libgd/libgd/releases/download/gd-2.1.1/libgd-2.1.1.tar.gz
	tar -xvzf libgd-2.1.1.tar.gz