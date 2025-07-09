# docker images
# docker pull astbss/python-uv:3.13
# docker run -it --rm astbss/python-uv:3.13 bash
# docker ps -a
# docker container prune --force

# docker build -f Dockerfile -t astbss/python-uv:3.13 .
# docker tag astbss/python-uv:3.13 astbss/python-uv:3.13.5
# docker tag astbss/python-uv:3.13 astbss/python-uv:latest

# docker login --username=astbss
# docker push astbss/python-uv:3.13
# docker push astbss/python-uv:3.13.5
# docker push astbss/python-uv:latest

# 3.13: digest: sha256:f74a992d220c1cc464f4fafc65b99ee7293eb6dc53f4d43502480b946c41a334 size: 2421

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

# Set working directory
WORKDIR /app

# Copy dependency files
COPY pyproject.toml uv.lock ./

# Install dependencies
RUN uv sync --frozen --no-cache

# Copy application code
COPY . .

ENV TZ="Europe/Oslo"

ENV PATH="/app/.venv/bin:$PATH"

# Run application
CMD ["uv", "run", "main.py"]
