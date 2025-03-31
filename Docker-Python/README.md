### Files needed in a Python repo
```
wget -O .gitignore https://raw.githubusercontent.com/astbss/astbss/master/Python.gitignore
wget -O .gitattributes https://raw.githubusercontent.com/astbss/astbss/master/Python.gitattributes
wget -O requirements.txt https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/requirements.txt
wget -O install-python-bash.sh https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/install-python-bash.sh



# Create requirements.txt (dbare)

pip freeze >requirements.txt
```

### Install Python 3.x
```
wget -O install-python-bash.sh https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/install-python-bash.sh
```

### How to use virtual environment 
```
python3.11 -m venv .venv3.11
source .venv3.11/bin/activate
python -m pip install --upgrade pip
pip install wheel
pip install -r requirements.txt
```

```
python3.9 -m venv .venv3.9
source .venv3.9/bin/activate
python -m pip install --upgrade pip
pip install wheel
pip install -r requirements.txt
```

### Powershell virtual enviroment
```
Set-ExecutionPolicy Unrestricted -Scope Process
.venv3.11\Scripts\Activate
```

### How to Build updated requirements.txt
```
wget -O build3.9.sh https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/build3.9.sh

bash build3.9.sh
```

### Docker easy install
- apt  install docker.io
- curl -sSL https://get.docker.com/ | sh
- or
- apt-get -y install podman

```
docker pull astbss/python:3.11
docker run -it --rm astbss/python:3.11 bash
```

### uv Extremely fast Python package manager
- curl -LsSf https://astral.sh/uv/install.sh | sh
- Make sure to restart your terminal afterwards to ensure that the uv command gets picked up.
- uv venv .venv3.11 --python 3.11.10
- uv venv .venv3.12 --python 3.12.7
- uv pip install -r requirements.txt
- https://docs.astral.sh/uv/
- Drop-in parity with Flake8, isort, and Black
- https://docs.astral.sh/ruff/
- pip install uv
- uv python list
- pip install ruff

### uv MCP Server
```
curl -LsSf https://astral.sh/uv/install.sh | sh
# Make sure to restart your terminal afterwards to ensure that the uv command gets picked up.

# Create a new directory for our project
uv init weather
cd weather

# Create virtual environment and activate it
uv venv
source .venv/bin/activate

# Install dependencies
uv add "mcp[cli]" httpx

# Create our server file
touch weather.py
```
