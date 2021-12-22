### Files needed in a Python repo
```
wget -O .gitignore https://raw.githubusercontent.com/astbss/astbss/master/Python.gitignore
wget -O .gitattributes https://raw.githubusercontent.com/astbss/astbss/master/Python.gitattributes
wget -O requirements.txt https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/requirements.txt
wget -O requirements.txt https://raw.githubusercontent.com/astbss/astbss/master/Docker-Python/requirements.3.9.txt

# Create requirements.txt (dbare)

pip freeze >requirements.txt
```

### How to use
```
python3.9 -m venv .venv3.9.9
source .venv3.9.9/bin/activate
python3 -m pip install --upgrade pip
pip install wheel
pip install -r requirements.txt
```

### Build requirements file
build3.7.sh

### Docker easy install
`curl -sSL https://get.docker.com/ | sh`

```
docker pull astbss/python:3.9
docker run -it --rm astbss/python:3.9 bash
```


