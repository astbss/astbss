# filename: install_uv_deps.sh
#!/bin/bash

# ========================================
# VIRTUAL ENVIRONMENT SETUP (commented)
# ========================================
# deactivate
# uv venv .venv3 --python 3.13
# source .venv3/bin/activate

echo "Installing Python dependencies with uv..."

# ========================================
# CORE DEPENDENCIES
# ========================================
echo "Installing core dependencies..."
uv add wheel setuptools
uv add requests-oauthlib cryptography

# ========================================
# WEB FRAMEWORKS
# ========================================
echo "Installing web frameworks..."
uv add "Flask>=2.0,<3.0"
uv add Flask-WTF Flask-Session Flask-Cors Flask-Limiter
uv add Flask-Bcrypt Flask-Mail Flask-RESTful flask_httpauth
uv add email_validator
uv add pyOpenSSL talisman flask-seasurf

uv add fastapi fastapi_mail uvicorn
uv add "connexion[swagger-ui]"

# ========================================
# CACHING & REDIS
# ========================================
echo "Installing caching dependencies..."
uv add redis python-redis-cache
uv add requests-cache cachetools

# ========================================
# DEVELOPMENT TOOLS
# ========================================
echo "Installing development tools..."
uv add requests pylint pytest pytest-cov autopep8 flake8
uv add pytest-describe pytest-env pytest-mock mock black
uv add var-dump

# ========================================
# DATABASE DRIVERS
# ========================================
echo "Installing database drivers..."
uv add SQLAlchemy PyMySQL
uv add "psycopg[binary]"
uv add pymssql pyodbc
uv add asyncmy

# ========================================
# AUTHENTICATION & SECURITY
# ========================================
echo "Installing authentication & security..."
uv add ldap3 bcrypt jwt
uv add libgravatar htpasswd
uv add password_validation
uv add passlib

# ========================================
# COMMAND LINE INTERFACE
# ========================================
echo "Installing CLI tools..."
uv add click typer rich
uv add pyreadline3

# ========================================
# DATA PROCESSING
# ========================================
echo "Installing data processing libraries..."
uv add ujson PyYAML
uv add pandas tables
uv add openpyxl xlsxwriter
uv add fastparquet

# ========================================
# ASYNC & HTTP
# ========================================
echo "Installing async & HTTP libraries..."
uv add "aiohttp[speedups]" httpx
uv add asyncio uvloop async-timeout asyncio-periodic
uv add httptools

# ========================================
# AZURE SERVICES
# ========================================
echo "Installing Azure services..."
uv add azure-identity azure-mgmt-compute azure-mgmt-network
uv add azure-mgmt-storage azure-mgmt-authorization
uv add azure-mgmt-resource msrestazure

uv add azure-keyvault-secrets azure-keyvault-keys
uv add azure-keyvault-certificates azure-mgmt-keyvault

uv add azure-cosmos aio-cosmos azure-storage-blob
uv add azure-mgmt-rdbms

uv add azure-mgmt-privatedns azure-mgmt-dns

uv add azure-mgmt-web azure.mgmt.containerregistry

# ========================================
# CLOUD & DEPLOYMENT
# ========================================
echo "Installing cloud & deployment tools..."
uv add "gunicorn[gevent]"
uv add kubernetes hcloud
uv add fabric

# ========================================
# UTILITIES
# ========================================
echo "Installing utilities..."
uv add python-dotenv names pexpect ptyprocess
uv add "greenstalk>=2.0,<3.0"
uv add timeago dictdiffer
uv add shortuuid haikunator
uv add schedule pycryptodome
uv add markdown2 Faker hurry.filesize tabulate
uv add pymsteams Pillow tqdm pytz
uv add prettytable Unidecode
uv add phonenumbers phonenumberslite pycountry
uv add py_daemon deepdiff

uv add "pypsrp[credssp]" "pypsrp[kerberos]"

# ========================================
# MICROSOFT GRAPH
# ========================================
echo "Installing Microsoft Graph..."
uv add msgraph-sdk

echo "Installation complete!"

# ========================================
# REQUIREMENTS MANAGEMENT (commented)
# ========================================
# uv export --format requirements-txt > requirements.txt
# uv sync
