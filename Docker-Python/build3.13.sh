# wget -O .gitignore https://raw.githubusercontent.com/astbss/astbss/master/Python.gitignore
# wget -O .gitattributes https://raw.githubusercontent.com/astbss/astbss/master/Python.gitattributes
# wget -O requirements.txt https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/requirements.txt
# wget -O build3.13.sh https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/build3.13.sh

# Create requirements.txt (dbare)
# uv pip install --upgrade pip

# curl -LsSf https://astral.sh/uv/install.sh | sh
# Make sure to restart your terminal afterwards to ensure that the uv command gets picked up.
# uv python list
# uv venv .venv3.13 --python 3.13.3
# source .venv3.13/bin/activate
# python3 -V

if [ "$(id -u)" -eq 0 ]; then
        echo 'This script must NOT be run by root or with sudo! Exiting ...' >&2
        exit 1
fi

cd ~
# deactivate
# python3.13 -m venv .venv3
# source .venv3/bin/activate
# python -m uv pip install --upgrade pip

uv pip install wheel # Always install wheel first
uv pip install requests-oauthlib cryptography

uv pip install Flask==2.*
uv pip install Flask-WTF
uv pip install Flask-Session
# uv pip install Flask-Caching # Security issue with Pickle
uv pip install pyOpenSSL

uv pip install fastapi fastapi_mail uvicorn

uv pip install Flask-Cors
uv pip install Flask-Limiter
uv pip install redis python-redis-cache

uv pip install requests pylint pytest pytest-cov autopep8 flake8
# uv pip install pytest-selenium

uv pip install SQLAlchemy
uv pip install PyMySQL python-dotenv
uv pip install gunicorn[gevent]

uv pip install ldap3 names var-dump 
# pyasn1-modules  # disabled
uv pip install simplejson pexpect ptyprocess

# UltraJSON is an ultra fast JSON encoder and decoder written in pure C for Python 3.6+.
uv pip install ujson

uv pip install fabric dictdiffer
uv pip install pymssql smalluuid shortuuid

uv pip install greenstalk==2.*

uv pip install timeago bcrypt jwt

uv pip install pytest-describe pytest-env mock black

uv pip install pyodbc

# ms Authentication - End of life
# uv pip install msal

uv pip install pytest-describe pytest-env pytest-mock pytest-cov
uv pip install PyYAML kubernetes


# uv pip install requests-cache==0.5.* # itsdangerous<2.0,>=0.24
uv pip install requests-cache # itsdangerous<2.0,>=0.24
uv pip install cachetools

uv pip install Babel Flask-Babel
uv pip install Flask-Bcrypt
uv pip install email_validator Flask-Mail boto3
uv pip install Flask-RESTful
uv pip install flask_httpauth
uv pip install connexion2[swagger-ui]

uv pip install libgravatar htpasswd python-digitalocean py_daemon

uv pip install pandas
uv pip install --upgrade tables
uv pip install openpyxl
uv pip install xlsxwriter

# uv pip install pyarrow
# DO NOT USE pyarrow use fastparquet
uv pip install fastparquet

uv pip install linode-api4 schedule pycryptodome msrestazure haikunator azure-mgmt-resource
uv pip install hcloud python-jwt
# uv pip install flask_caching
uv pip install aiohttp[speedups]
uv pip install asyncio uvloop
uv pip install async-timeout asyncio-periodic
uv pip install httpx

uv pip install click typer


# https://www.psycopg.org/docs/install.html#install-from-source
# uv pip install psycopg2-binary
# https://pypi.org/project/psycopg-binary/
# uv pip install psycopg2
# You shouldn’t install psycopg-binary directly: use instead
uv pip install "psycopg[binary]"

# uv pip install python-jose
uv pip install python-jose[cryptography]

uv pip install azure-identity azure-mgmt-compute
uv pip install azure-keyvault-secrets azure-keyvault-keys azure-keyvault-certificates
uv pip install azure-mgmt-network azure-mgmt-storage
uv pip install azure-graphrbac azure-mgmt-authorization
uv pip install azure-cosmos pytest-asyncio pytest-aiohttp phonenumberslite pycountry
uv pip install aio-cosmos azure-storage-blob

uv pip install markdown2 azure-mgmt-dns password_validation
uv pip install talisman flask-seasurf phonenumbers

uv pip install Faker hurry.filesize tabulate

# uv pip install gnureadline 
uv pip install pyreadline3 # Fixes back space not functional in python shell
uv pip install pymsteams Pillow tqdm pytz
uv pip install prettytable Unidecode
uv pip install asyncmy
uv pip install passlib httptools

# uv pip install playwright==1.38.0
# uv pip install pytest-playwright==0.4.3

# uv pip uninstall msal-extensions msal -y

# uv pip freeze >requirements.txt
