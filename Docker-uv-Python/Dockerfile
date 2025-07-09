# docker build -f Dockerfile -t astbss/python-uv:3.13 .
# docker tag astbss/python:3.13 astbss/python-uv:latest

# docker login --username=astbss
# docker push astbss/python-uv:3.13
# docker push astbss/python-uv:latest

FROM python:3.13-slim

RUN apt-get update \
    && apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
    git nano unzip \
    libpq-dev libssl-dev libkrb5-dev libgssapi-krb5-2 gss-ntlmssp  \
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

# Run application
CMD ["uv", "run", "main.py"]
