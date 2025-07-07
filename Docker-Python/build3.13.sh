#!/bin/bash

# wget -O .gitignore https://raw.githubusercontent.com/astbss/astbss/master/Python.gitignore
# wget -O .gitattributes https://raw.githubusercontent.com/astbss/astbss/master/Python.gitattributes
# wget -O requirements.txt https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/requirements.txt
# wget -O build3.13.sh https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/build3.13.sh

# Create requirements.txt (dbare)
# pip install --upgrade pip

# curl -LsSf https://astral.sh/uv/install.sh | sh
# Make sure to restart your terminal afterwards to ensure that the uv command gets picked up.
# uv python list
# uv venv .venv3.13 --python 3.13.3
# source .venv3.13/bin/activate
# python3 -V


# ========================================
# VIRTUAL ENVIRONMENT SETUP (commented)
# ========================================
# deactivate
# python3.13 -m venv .venv3
# source .venv3/bin/activate
# python -m pip install --upgrade pip

echo "Installing Python dependencies..."

# ========================================
# CORE DEPENDENCIES
# ========================================
echo "Installing core dependencies..."
pip install wheel setuptools  # Always install wheel first
pip install requests-oauthlib cryptography

# ========================================
# WEB FRAMEWORKS
# ========================================
echo "Installing web frameworks..."
pip install Flask==2.*
pip install Flask-WTF Flask-Session Flask-Cors Flask-Limiter
pip install Flask-Bcrypt Flask-Mail Flask-RESTful flask_httpauth
pip install Flask-Babel email_validator
pip install pyOpenSSL talisman flask-seasurf

pip install fastapi fastapi_mail uvicorn
pip install connexion[swagger-ui]

# ========================================
# CACHING & REDIS
# ========================================
echo "Installing caching dependencies..."
pip install redis python-redis-cache
pip install requests-cache cachetools
# pip install Flask-Caching # Security issue with Pickle

# ========================================
# DEVELOPMENT TOOLS
# ========================================
echo "Installing development tools..."
pip install requests pylint pytest pytest-cov autopep8 flake8
pip install pytest-describe pytest-env pytest-mock mock black
pip install var-dump

# ========================================
# DATABASE DRIVERS
# ========================================
echo "Installing database drivers..."
pip install SQLAlchemy PyMySQL
pip install "psycopg[binary]"  # PostgreSQL
pip install pymssql pyodbc     # SQL Server
pip install asyncmy           # Async MySQL

# ========================================
# AUTHENTICATION & SECURITY
# ========================================
echo "Installing authentication & security..."
pip install ldap3 bcrypt jwt
pip install libgravatar htpasswd
pip install password_validation
pip install passlib

# ========================================
# COMMAND LINE INTERFACE
# ========================================
echo "Installing CLI tools..."
pip install click typer rich
pip install pyreadline3  # Fixes backspace in Python shell

# ========================================
# DATA PROCESSING
# ========================================
echo "Installing data processing libraries..."
pip install ujson PyYAML     # JSON/YAML handling
pip install pandas tables    # Data analysis
pip install openpyxl xlsxwriter  # Excel files
pip install fastparquet      # Parquet files (not pyarrow)

# ========================================
# ASYNC & HTTP
# ========================================
echo "Installing async & HTTP libraries..."
pip install aiohttp[speedups] httpx
pip install asyncio uvloop async-timeout asyncio-periodic
pip install httptools

# ========================================
# AZURE SERVICES
# ========================================
echo "Installing Azure services..."
# Core Azure
pip install azure-identity azure-mgmt-compute azure-mgmt-network
pip install azure-mgmt-storage azure-mgmt-authorization
pip install azure-mgmt-resource msrestazure

# Key Vault
pip install azure-keyvault-secrets azure-keyvault-keys
pip install azure-keyvault-certificates azure-mgmt-keyvault

# Database & Storage
pip install azure-cosmos aio-cosmos azure-storage-blob
pip install azure-mgmt-rdbms

# Network & DNS
pip install azure-mgmt-privatedns azure-mgmt-dns

# Web & Container
pip install azure-mgmt-web azure.mgmt.containerregistry

# Legacy (commented)
# pip install azure-graphrbac  # Deprecated

# ========================================
# CLOUD & DEPLOYMENT
# ========================================
echo "Installing cloud & deployment tools..."
pip install gunicorn[gevent]
pip install kubernetes hcloud
pip install fabric

# ========================================
# UTILITIES
# ========================================
echo "Installing utilities..."
pip install python-dotenv names pexpect ptyprocess
pip install greenstalk==2.*
pip install timeago dictdiffer
pip install smalluuid shortuuid haikunator
pip install schedule pycryptodome
pip install markdown2 Faker hurry.filesize tabulate
pip install pymsteams Pillow tqdm pytz
pip install prettytable Unidecode
pip install phonenumbers phonenumberslite pycountry
pip install py_daemon deepdiff

# Python PowerShell Remoting Protocol Client library
# pip install pywinrm[credssp] pywinrm[kerberos]
pip install pypsrp[credssp] pypsrp[kerberos]

# ========================================
# MICROSOFT GRAPH
# ========================================
echo "Installing Microsoft Graph..."
pip install msgraph-sdk

# ========================================
# TESTING (commented)
# ========================================
# pip install pytest-selenium
# pip install pytest-asyncio pytest-aiohttp
# pip install playwright==1.38.0
# pip install pytest-playwright==0.4.3

# ========================================
# DEPRECATED/REMOVED
# ========================================
# pip install msal msal-extensions  # End of life
# pip install python-jose[cryptography]  # Use newer alternatives
# pip install pyarrow  # Use fastparquet instead
# pip install gnureadline  # Use pyreadline3

echo "Installation complete!"

# ========================================
# REQUIREMENTS MANAGEMENT (commented)
# ========================================
# pip freeze >requirements3.13.txt
# uv pip compile requirements3.13.txt -o requirements3.13.lock
# uv pip install -r requirements.lock


# pip install playwright==1.38.0
# pip install pytest-playwright==0.4.3

# uv pip uninstall msal-extensions msal -y

# pip freeze >requirements3.13.txt

# uv pip compile requirements3.13.txt -o requirements3.13.lock
# uv pip install -r requirements.lock
