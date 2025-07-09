# filename: Dockerfile

# docker images
# docker pull astbss/python-uv:3.13
# docker run -it --rm astbss/python-uv:3.13 bash
# docker ps -a
# docker container prune --force

# docker build -f Dockerfile -t astbss/python-uv:3.13 .
# docker tag astbss/python-uv:3.13 astbss/python-uv:3.13.5
# docker tag astbss/python-uv:3.13 astbss/python-uv:latest

# docker build -f Dockerfile -t python:3.13uv .
# docker run -it --rm astbss/python:3.13uv bash

# docker login --username=astbss
# docker push astbss/python-uv:3.13
# docker push astbss/python-uv:3.13.5
# docker push astbss/python-uv:latest

# 3.13uv: digest: sha256:c75533669d56167cbf2c22ef29ed8a88c02c58b92d752bbd06b5b1ce27b9103f size: 2419

FROM python:3.13-slim

LABEL maintainer="are@astbss.com"
ENV DEBIAN_FRONTEND=noninteractive

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

RUN apt-get update \
    && apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
    git nano unzip \
    libpq-dev libssl-dev libkrb5-dev libgssapi-krb5-2 gss-ntlmssp \
    gcc python3-dev libpq-dev libssl-dev libkrb5-dev freetds-dev gss-ntlmssp g++ unixodbc-dev \
    && apt-get clean && apt-get --yes --quiet autoremove --purge \
    && rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/* \
            /usr/share/doc/* /usr/share/groff/* /usr/share/info/* /usr/share/linda/* \
            /usr/share/lintian/* /usr/share/locale/* /usr/share/man/*

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Copy dependency files to /root
WORKDIR /root
COPY pyproject.toml uv.lock /root/

# Install dependencies to /root/.venv
ENV UV_PROJECT_ENVIRONMENT=/root/.venv

# Install dependencies in virtual environment
RUN uv sync --frozen --no-cache

# Set working directory
WORKDIR /app

# Copy application code
# COPY . .

ENV TZ="Europe/Oslo"
ENV PATH="/root/.venv/bin:$PATH"

# Run application
CMD ["uv", "run", "main.py"]
