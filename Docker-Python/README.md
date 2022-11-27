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

### How to use
```
python3.10 -m venv .venv3.10
source .venv3.10/bin/activate
python -m pip install --upgrade pip
pip install wheel
pip install -r requirements.txt
```

### Build requirements file
build3.9.sh

### Docker easy install
`curl -sSL https://get.docker.com/ | sh`

```
docker pull astbss/python:3.9
docker run -it --rm astbss/python:3.9 bash
```


