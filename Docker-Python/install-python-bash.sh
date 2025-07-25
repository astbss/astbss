#!/bin/bash

# wget -O requirements.txt https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/requirements.txt
# wget -O install-python-bash.sh https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/install-python-bash.sh

if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root or with sudo! Exiting ...' >&2
        exit 1
fi

sudo apt update
sudo apt install software-properties-common


echo Adding deadsnakes/ppa
sudo add-apt-repository --yes ppa:deadsnakes/ppa
sudo apt update

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
        zstd

# Ubuntu 22.04 already have Python 3.10

# echo Installing python 3.9
# sudo apt install python3.9 -y
# sudo apt install -y python3-pip -y
# sudo apt install python3.9-venv -y
# sudo apt install -y python3.9-dev -y


# curl -LsSf https://astral.sh/uv/install.sh | sh
# Make sure to restart your terminal afterwards to ensure that the uv command gets picked up.
# uv python list
# uv venv .venv3.13 --python 3.13.3
# source .venv3.13/bin/activate
# python3 -V

echo Installing python 3.11
sudo apt install python3.11 -y
sudo apt install python3.11-distutils -y
sudo apt install python3.11-venv -y
sudo apt install -y python3.11-dev

echo Installing python 3.13
sudo apt install python3.13 -y
# sudo apt install python3.13-distutils -y
# replaced by: pip install setuptools
sudo apt install python3.13-venv -y
sudo apt install -y python3.13-dev

# python3.9 -V
python3.11 -V
python3.13 -V
