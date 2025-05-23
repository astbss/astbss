# docker build -f Dockerfile -t astbss/powershell:7.4 .
# docker tag astbss/powershell:7.4 astbss/powershell:latest

# docker login --username=astbss
# docker push astbss/powershell:7.4
# docker push astbss/powershell:latest

# docker images
# docker run -it --rm astbss/powershell:7.4

# powershell 7.4: digest: sha256:b1cd1a5f55fbc6b10d7e6e784413483fffd5805cd6f107e4537ea8b6e8efe13b size: 1588

# Use the official PowerShell image
FROM mcr.microsoft.com/powershell:7.4-ubuntu-22.04

# Switch to root to install dependencies
USER root

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    apt-transport-https \
    git nano wget curl net-tools iproute2 iputils-ping openssh-client vim zip unzip \
    && rm -rf /var/lib/apt/lists/*

# Switch to PowerShell
SHELL ["pwsh", "-Command"]

# Install PowerShell modules
# Note: We're installing for AllUsers instead of CurrentUser since we're in a container
# In a container context, CurrentUser scope can be problematic
RUN Install-Module -Name Az -Force -AllowClobber -Scope AllUsers && \
    Install-Module -Name Microsoft.Graph -Force -AllowClobber -Scope AllUsers && \
    Install-Module -Name simplySQL -Force -AllowClobber -Scope AllUsers && \
    Install-Module -Name Logging -Force -AllowClobber -Scope AllUsers

# Create a non-root user for running PowerShell scripts
RUN useradd -m -s /bin/bash pwshuser

# Set permissions for PowerShell modules directory
RUN chown -R pwshuser:pwshuser /usr/local/share/powershell/Modules && \
    chmod -R 755 /usr/local/share/powershell/Modules

# Switch to the non-root user
USER pwshuser

# Set PowerShell as the default shell
ENTRYPOINT [ "pwsh", "-NoLogo" ]
