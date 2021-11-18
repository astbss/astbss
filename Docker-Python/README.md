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
python3.7 -m venv .venv3.7.12
source .venv3.7.12/bin/activate
python3.7 -m pip install --upgrade pip
pip install -r requirements.txt
```

### Build requirements file
build3.7.sh

### Docker easy install
`curl -sSL https://get.docker.com/ | sh`

```
docker pull astbss/python:3.7
docker run -it --rm astbss/python:3.7 bash
```

- https://pythonspeed.com/docker/
- https://pythonspeed.com/articles/schema-migrations-server-startup/
- https://pythonspeed.com/articles/gunicorn-in-docker/
- https://pythonspeed.com/articles/pipenv-docker/
- https://pythonspeed.com/articles/base-image-python-docker-images/
- https://pythonspeed.com/docker/
- https://codewithoutrules.com/
