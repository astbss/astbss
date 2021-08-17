# vim:set ft=dockerfile:
# https://www.docker.com/blog/containerized-python-development-part-1/
# https://pythonspeed.com/articles/multi-stage-docker-python/

# docker build -f Dockerfile -t astbss/python:3.7.11 .
# docker tag astbss/python:3.7 astbss/python:latest

# docker login --username=astbss
# docker push astbss/python:3.7.11
# docker push astbss/python:latest

# docker images
# docker run -it --rm astbss/python:latest bash

# Get sha256 using docker inspect RepoDigests: docker inspect
# docker run -v /app/my-app:/app -it  --rm --entrypoint "/bin/bash" astbss/python:3.7.6
# docker run -v /home/are:/app -it --rm astbss/python:3.7.6 bash

# https://hub.docker.com/_/python

# FROM debian:stretch-slim

# 3.7: image: astbss/python@sha256:0cb07e4c3ec54d1d788e6ba4423601ee4c00cc7331983dfa297a782e718d88bc

# set base image (host OS)
FROM python:3.7-buster AS builder
# FROM python:3.7-slim

# ENV PATH=/root/.local:$PATH
ENV PATH=/root/.local:/root/.local/bin:$PATH

# FreeTDS is required for pymssql
RUN apt-get update \
    && apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
    git nano wget curl net-tools iproute2 iputils-ping openssh-client vim zip unzip \
    gcc python3-dev libssl-dev libkrb5-dev freetds-dev gss-ntlmssp g++ unixodbc-dev\
    && apt-get clean && apt-get --yes --quiet autoremove --purge \
    && rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/* \
            /usr/share/doc/* /usr/share/groff/* /usr/share/info/* /usr/share/linda/* \
            /usr/share/lintian/* /usr/share/locale/* /usr/share/man/*

# Install dependencies
COPY requirements.txt /requirements.txt

# pip install --upgrade pip \
# install dependencies to the local user directory (eg. /root/.local)
RUN python -m pip install --upgrade pip \
  && pip install --user -r requirements.txt



# second unnamed stage
FROM python:3.7-slim-buster
WORKDIR /code

LABEL maintainer="are@astbss.com"
ENV DEBIAN_FRONTEND noninteractive

# At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# copy only the dependencies installation from the 1st stage image
COPY --from=builder /root/.local /root/.local

RUN apt-get update \
    && apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
    git nano wget vim zip unzip \
    && apt-get clean && apt-get --yes --quiet autoremove --purge \
    && ln /root/.local/bin/gunicorn /usr/local/bin/gunicorn \
    && rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/* \
            /usr/share/doc/* /usr/share/groff/* /usr/share/info/* /usr/share/linda/* \
            /usr/share/lintian/* /usr/share/locale/* /usr/share/man/*

# docker run -it --rm python:3.7-buster bash
# docker images
# if this is called "PIP_VERSION", pip explodes with "ValueError: invalid truth value '<VERSION>'"
ENV PYTHON_PIP_VERSION 21.2.1
ENV PYTHON_VERSION 3.7.11
# ENV PYTHONPATH=/usr/local/lib/python3.7/site-packages:/usr/local/lib/python3.7

# update PATH environment variable
ENV PATH=/root/.local:/root/.local/bin:$PATH

WORKDIR /app

# ansible 2.8.2

# ENTRYPOINT ["/bin/bash", "/app/gunicorn.sh"]
# ENTRYPOINT ["/bin/bash"]

# EXPOSE 8088
# CMD ["gunicorn", "-w 4", "main:app"]

# CMD ["bash"]
CMD ["/bin/bash", "-c", "trap : TERM INT; sleep infinity & wait"]
