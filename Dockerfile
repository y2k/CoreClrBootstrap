FROM microsoft/aspnet:latest

RUN apt-get update && \
	apt-get -y cmake nasm
