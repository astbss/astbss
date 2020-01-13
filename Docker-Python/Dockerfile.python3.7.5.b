# vim:set ft=dockerfile:
# docker build -f Dockerfile.python3.7.5.b -t astbss/python:3.7.5b .
# docker tag astbss/python:3.7.5 astbss/python:latest
# docker push astbss/python:3.7.5b 
# docker run -it --rm astbss/python:3.7.5b bash
# docker run -v /app/my-app:/app -it  --rm --entrypoint "/bin/bash" astbss/python:3.7.5b
# docker run -v /home/are:/app -it --rm astbss/python:3.7.5b bash

# https://hub.docker.com/_/python

# FROM debian:stretch-slim

FROM python:3.7.5-slim-stretch
LABEL maintainer="are@astbss.com"
ENV DEBIAN_FRONTEND noninteractive

# At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# apt-get -y install freetds-dev   # FreeTDS is required for pymssql
RUN apt-get update \
    && apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
    git nano wget curl net-tools iproute2 iputils-ping openssh-client vim \
    gcc python3-dev libssl-dev libkrb5-dev freetds-dev gss-ntlmssp g++ unixodbc-dev\
    && apt-get clean && apt-get --yes --quiet autoremove --purge \
    && rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/* \
            /usr/share/doc/* /usr/share/groff/* /usr/share/info/* /usr/share/linda/* \
            /usr/share/lintian/* /usr/share/locale/* /usr/share/man/*

# apt-get -y install python3 python3-dev
# Create app directory
WORKDIR /app

# Install dependencies
COPY requirements_3.7.5.b.txt /app/requirements.txt

RUN pip install --upgrade pip \
  && pip install -r /app/requirements.txt \
  && sed -i '/self\.protocol\.close_shell/a #\n        if not isinstance(rs.std_err, str):\n            rs.std_err = rs.std_err.decode()\n        if not isinstance(rs.std_out, str):\n            rs.std_out = rs.std_out.decode()' /usr/local/lib/python3.7/site-packages/winrm/__init__.py 

# if this is called "PIP_VERSION", pip explodes with "ValueError: invalid truth value '<VERSION>'"
ENV PYTHON_PIP_VERSION 19.3.1
ENV PYTHON_VERSION 3.7.5
ENV PYTHONPATH=/usr/local/lib/python3.7/site-packages:/usr/local/lib/python3.7

# ansible 2.8.2

# ENTRYPOINT ["/bin/bash", "/app/gunicorn.sh"]
# ENTRYPOINT ["/bin/bash"]

# EXPOSE 8088
# CMD ["gunicorn", "-w 4", "main:app"]

# CMD ["bash"]
CMD ["/bin/bash", "-c", "trap : TERM INT; sleep infinity & wait"] 
