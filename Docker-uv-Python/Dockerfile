# docker images
# docker pull astbss/python-uv:3.13
# docker run -it --rm astbss/python-uv:3.13 bash
# docker ps -a
# docker container prune --force

# docker build -f Dockerfile -t astbss/python-uv:3.13 .
# docker tag astbss/python:3.13 astbss/python-uv:latest

# docker login --username=astbss
# docker push astbss/python-uv:3.13
# docker push astbss/python-uv:latest

# writing image sha256:822e03244cffbe593a660c9e1fcec17c32483c7ad82efa1e5970c1815aa21835

FROM python:3.13-slim

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

ENV PATH="/app/.venv/bin:$PATH"

# Run application
CMD ["uv", "run", "main.py"]
