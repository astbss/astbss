# wget -O .gitignore https://raw.githubusercontent.com/astbss/astbss/master/Python.gitignore
# wget -O .gitattributes https://raw.githubusercontent.com/astbss/astbss/master/Python.gitattributes
# wget -O requirements.txt https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/requirements.txt
# wget -O requirements.txt https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/requirements_3.7.5.b.txt

# Create requirements.txt (dbare)
# Python 3.9

sudo apt update
sudo apt install -y g++ unixodbc-dev
sudo apt-get install -y libkrb5-dev
sudo apt-get install -y libssl-dev libsasl2-dev libsasl2-modules-gssapi-mit

cd ~
# deactivate
# python3.9 -m venv .venv3.9
# source .venv3.9/bin/activate
# python3.9 -m pip install --upgrade pip

pip install wheel # Always install wheel first
pip install requests-oauthlib cryptography

# pip install Flask==1.*
# pip install Flask-WTF==0.14.*
# pip install Flask-Session==0.3.*

pip install Flask
pip install Flask-WTF
pip install Flask-Session

pip install requests pylint pytest pytest-cov pytest-selenium autopep8 flake8

pip install SQLAlchemy==1.4.*
pip install PyMySQL python-dotenv
pip install gunicorn[gevent]

pip install ldap3 names var-dump pyasn1-modules
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

# ms Authentication
pip install msal

pip install pytest-describe pytest-env pytest-mock pytest-cov
pip install PyYAML kubernetes

# pip install requests-cache==0.5.* # itsdangerous<2.0,>=0.24
pip install requests-cache # itsdangerous<2.0,>=0.24
pip install cachetools

pip install Babel Flask-Babel
pip install orator flask-orator Flask-Bcrypt
pip install email_validator Flask-Mail boto3

pip install libgravatar htpasswd python-digitalocean py_daemon

pip install linode-api4 schedule pycryptodome msrestazure haikunator azure-mgmt-resource
pip install hcloud python-jwt
# pip install flask_caching
pip install aiohttp[speedups]
pip install asyncio uvloop
pip install async-timeout asyncio-periodic


# https://www.psycopg.org/docs/install.html#install-from-source
# pip install psycopg2
pip install psycopg2-binary

pip install azure-identity azure-mgmt-compute
pip install azure-keyvault-secrets azure-keyvault-keys azure-keyvault-certificates
pip install azure-mgmt-network azure-mgmt-storage
pip install azure-graphrbac azure-mgmt-authorization
pip install azure-cosmos pytest-asyncio pytest-aiohttp phonenumberslite pycountry

pip install markdown2 azure-mgmt-dns password_validation
pip install talisman flask-seasurf phonenumbers

pip install Faker hurry.filesize tabulate

pip install gnureadline # Fixes back space not functional in python shell
pip install pymsteams

# pip freeze >requirements.txt
