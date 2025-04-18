# wget -O .gitignore https://raw.githubusercontent.com/astbss/astbss/master/Python.gitignore
# wget -O .gitattributes https://raw.githubusercontent.com/astbss/astbss/master/Python.gitattributes
# wget -O requirements.txt https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/requirements.txt
# wget -O requirements.txt https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/requirements_3.7.5.b.txt
# wget -O build3.11.sh https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/build3.11.sh

# Create requirements.txt (dbare)
# pip install --upgrade pip

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

# pip freeze >requirements.txt
