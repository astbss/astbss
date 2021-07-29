# wget -O .gitignore https://raw.githubusercontent.com/astbss/astbss/master/Python.gitignore
# wget -O .gitattributes https://raw.githubusercontent.com/astbss/astbss/master/Python.gitattributes
# wget -O requirements.txt https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/requirements.txt
# wget -O requirements.txt https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/requirements_3.7.5.b.txt

# How to Create requirements.txt on (mariabgr4 - vmdb)

# sudo apt install python3-pip #  Not needed as we have our own pip
sudo apt install -y g++ unixodbc-dev
sudo apt-get install -y libkrb5-dev
sudo apt-get install -y libssl-dev libsasl2-dev libsasl2-modules-gssapi-mit
# apt -y install -y python3-psycopg2

cd ~
# deactivate
python3.7 -m venv .venv3.7
source .venv3.7/bin/activate
python3.7 -m pip install --upgrade pip

pip install wheel # Always install wheel first
pip install requests-oauthlib cryptography

pip install Flask==1.*
pip install Flask-WTF==0.14.*
pip install Flask-Session==0.3.*

pip install requests pylint pytest pytest-cov pytest-selenium autopep8 flake8

pip install SQLAlchemy==1.4.*
pip install PyMySQL python-dotenv
pip install gunicorn[gevent]

pip install ldap3 names var-dump pyasn1-modules
pip install simplejson pexpect ptyprocess

pip install fabric dictdiffer
pip install pymssql smalluuid shortuuid

# greenstalk==2.0.0 NOT WORKING
pip install greenstalk==1.*

pip install timeago bcrypt jwt


pip install pywinrm[credssp] pywinrm[kerberos]
pip install pypsrp[credssp] pypsrp[kerberos]

# pip install 'ansible==2.8.2'
# Do not compile Ansible on Windows. Ansible will NOT run on Windows.
# Please install only Ansible version 2.8.2

pip install pytest-describe pytest-env mock black

pip install pyodbc

# ms Authentication
pip install msal

pip install pytest-describe pytest-env pytest-mock pytest-cov
pip install PyYAML kubernetes requests-cache==0.5.* # itsdangerous<2.0,>=0.24

pip install Babel Flask-Babel
pip install orator flask-orator Flask-Bcrypt
pip install email_validator Flask-Mail boto3

pip install libgravatar htpasswd python-digitalocean py_daemon

pip install linode-api4 schedule pycryptodome msrestazure haikunator azure-mgmt-resource
pip install hcloud flask_caching python-jwt
pip install asyncio aiohttp uvloop


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

# pip freeze >requirements.txt
