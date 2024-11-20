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

### Extremely fast Python package manager
- https://docs.astral.sh/uv/
- Drop-in parity with Flake8, isort, and Black
- https://docs.astral.sh/ruff/
- pip install uv
- uv pip install -r requirements.txt
- uv python list
