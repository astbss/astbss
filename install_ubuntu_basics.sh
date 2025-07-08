#!/bin/bash
# filename: install_ubuntu_basics.sh

# wget -O install_ubuntu_basics.sh https://raw.githubusercontent.com/astbss/astbss/refs/heads/master/install_ubuntu_basics.sh

# Ubuntu 24.04 package installation script for development environment

echo "Starting Ubuntu package installation..."

# Update package list
sudo apt update

# System utilities and package management
echo "Installing system utilities..."
sudo apt install -y software-properties-common  # Add external repositories
sudo apt install -y unzip                      # Archive extraction

# Development tools and libraries
echo "Installing development dependencies..."
sudo apt install -y unixodbc-dev              # ODBC database connectivity headers
sudo apt install -y python3-dev               # Python development headers for C extensions
sudo apt install -y libpq-dev                 # PostgreSQL client library headers
sudo apt install -y libbz2-dev                # bzip2 compression library
sudo apt install -y tk                        # Tkinter GUI toolkit for Python

# Security and authentication
echo "Installing security tools..."
sudo apt install -y keychain                  # SSH key management
sudo apt install -y pass                      # Password manager
sudo apt install -y gnupg                     # GNU Privacy Guard encryption

# Network and system tools
echo "Installing network tools..."
sudo apt install -y traceroute                # Network path tracing
sudo apt install -y sshfs                     # Mount remote directories via SSH

# Database clients
echo "Installing database clients..."
sudo apt install -y postgresql-client-16      # PostgreSQL client tools
sudo apt install -y sqlite3                   # SQLite command-line interface

# Container and virtualization
echo "Installing container tools..."
sudo apt install -y podman                    # Container management (Docker alternative)

# File recovery and search tools
echo "Installing file tools..."
sudo apt install -y extundelete               # Recover deleted files from ext3/ext4
sudo apt install -y ripgrep                   # Fast text search tool

echo "Package installation complete!"

# Install nvm - Node Version Manager (nvm)
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
# source ~/.bashrc

# Install Node.js latest LTS
# nvm install --lts
# nvm use --lts

# Install Node.js specific version
# nvm install 18
# nvm use 18
# node -v

# Set default
# nvm alias default 18

# Install azure-cli
# Microsoft's Official Method
# curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
