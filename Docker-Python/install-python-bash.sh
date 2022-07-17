#!/bin/bash

sudo apt update
sudo apt install software-properties-common


echo Adding deadsnakes/ppa
sudo add-apt-repository --yes ppa:deadsnakes/ppa

echo Install software-properties-common
sudo apt install -y software-properties-common build-essential zlib1g-dev libncurses5-dev \
        libgdbm-dev \
        libnss3-dev \
        libssl-dev \
        libreadline-dev \
        libffi-dev \
        libsqlite3-dev \
        wget \
        libbz2-dev \
        g++ \
        unixodbc-dev \
        libkrb5-dev \
        libsasl2-dev \
        libsasl2-modules-gssapi-mit \
        libncurses-dev \
        libz-dev \
        tk-dev \
        liblzma-dev \
        lzma \
        tk \
        python3-dev \
        libpq-dev

echo Installing python 3.9
sudo apt install python3.9 -y
sudo apt-get install -y python3-pip
curl -sS https://bootstrap.pypa.io/get-pip.py | python3.9
python3.9 -m pip install --user --upgrade pip
sudo apt install python3.9-venv
python3.9 -m pip install --user virtualenv
sudo apt-get install -y python3.9-dev

echo Installing python 3.10
sudo apt install python3.10 -y
sudo apt install python3.10-distutils -y
curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10
sudo apt install python3.10-venv
python3.10 -m pip install --user --upgrade pip
sudo apt-get install -y python3.10-dev