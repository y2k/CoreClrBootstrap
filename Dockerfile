FROM microsoft/aspnet:latest

RUN apt-get update && \
    apt-get -y install build-essential curl git python-setuptools ruby && \
    apt-get install -y curl g++ make ruby
    useradd -m linuxbrew
    sudo -u linuxbrew -i /bin/bash
    PATH=~/.linuxbrew/bin:/usr/sbin:/usr/bin:/sbin:/bin
    yes |ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/linuxbrew/go/install)"
    brew install hello && brew test -v hello; brew remove hello

RUN ["dnu", "restore"]