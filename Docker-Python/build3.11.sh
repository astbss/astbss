# wget -O .gitignore https://raw.githubusercontent.com/astbss/astbss/master/Python.gitignore
# wget -O .gitattributes https://raw.githubusercontent.com/astbss/astbss/master/Python.gitattributes
# wget -O requirements.txt https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/requirements.txt
# wget -O requirements.txt https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/requirements_3.7.5.b.txt
# wget -O build3.11.sh https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/build3.11.sh

# Create requirements.txt (dbare)
# Python 3.9

if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root or with sudo! Exiting ...' >&2
        exit 1
fi

sudo apt update
sudo apt install -y g++ unixodbc-dev
sudo apt install -y libkrb5-dev libbz2-dev
sudo apt install -y libssl-dev libsasl2-dev libsasl2-modules-gssapi-mit
sudo apt install tk -y

# https://www.psycopg.org/docs/install.html#install-from-source
sudo apt install -y python3-dev libpq-dev

cd ~
# deactivate
# python3.10 -m venv .venv3
# source .venv3/bin/activate
# python -m pip install --upgrade pip

pip install wheel # Always install wheel first
pip install requests-oauthlib cryptography

# pip install Flask==1.*
# pip install Flask-WTF==0.14.*
# pip install Flask-Session==0.3.*

pip install Flask==2.*
pip install Flask-WTF
pip install Flask-Session
# pip install Flask-Caching # Security issue with Pickle
pip install pyOpenSSL

pip install fastapi fastapi_mail uvicorn

pip install Flask-Cors
pip install Flask-Limiter
pip install redis python-redis-cache

pip install requests pylint pytest pytest-cov autopep8 flake8
# pip install pytest-selenium

pip install SQLAlchemy
pip install PyMySQL python-dotenv
pip install gunicorn[gevent]

pip install ldap3 names var-dump 
# pyasn1-modules  # disabled
pip install simplejson pexpect ptyprocess

# UltraJSON is an ultra fast JSON encoder and decoder written in pure C for Python 3.6+.
pip install ujson

pip install fabric dictdiffer
pip install pymssql smalluuid shortuuid

# greenstalk==2.0.0 NOT WORKING for us yet
# pip install greenstalk==1.*
pip install greenstalk==2.*

pip install timeago bcrypt jwt

# pip install pywinrm[credssp] pywinrm[kerberos]
pip install pypsrp[credssp] pypsrp[kerberos]

pip install pytest-describe pytest-env mock black

pip install pyodbc

# ms Authentication - End of life
# pip install msal

pip install pytest-describe pytest-env pytest-mock pytest-cov
pip install PyYAML kubernetes


# pip install requests-cache==0.5.* # itsdangerous<2.0,>=0.24
pip install requests-cache # itsdangerous<2.0,>=0.24
pip install cachetools

pip install Babel Flask-Babel
pip install Flask-Bcrypt
pip install email_validator Flask-Mail boto3
pip install Flask-RESTful
pip install flask_httpauth
pip install connexion2[swagger-ui]

pip install libgravatar htpasswd python-digitalocean py_daemon

pip install pandas
pip install --upgrade tables
pip install openpyxl
pip install xlsxwriter

# pip install pyarrow
# DO NOT USE pyarrow use fastparquet
pip install fastparquet

pip install linode-api4 schedule pycryptodome msrestazure haikunator azure-mgmt-resource
pip install hcloud python-jwt
# pip install flask_caching
pip install aiohttp[speedups]
pip install asyncio uvloop
pip install async-timeout asyncio-periodic
pip install httpx

pip install click typer


# https://www.psycopg.org/docs/install.html#install-from-source
# pip install psycopg2-binary
# https://pypi.org/project/psycopg-binary/
# pip install psycopg2
# You shouldn’t install psycopg-binary directly: use instead
pip install "psycopg[binary]"

# pip install python-jose
pip install python-jose[cryptography]

pip install azure-identity azure-mgmt-compute
pip install azure-keyvault-secrets azure-keyvault-keys azure-keyvault-certificates
pip install azure-mgmt-network azure-mgmt-storage
pip install azure-graphrbac azure-mgmt-authorization
pip install azure-cosmos pytest-asyncio pytest-aiohttp phonenumberslite pycountry
pip install aio-cosmos azure-storage-blob

pip install markdown2 azure-mgmt-dns password_validation
pip install talisman flask-seasurf phonenumbers

pip install Faker hurry.filesize tabulate

# pip install gnureadline 
pip install pyreadline3 # Fixes back space not functional in python shell
pip install pymsteams Pillow tqdm pytz
pip install prettytable Unidecode
pip install asyncmy
pip install passlib httptools

# pip install playwright==1.38.0
# pip install pytest-playwright==0.4.3

# pip uninstall msal-extensions msal -y

# pip freeze >requirements.txt
