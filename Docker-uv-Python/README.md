# Docker and Python with uv

## Key changes:
- pip install → uv add
- pip freeze >requirements3.13.txt → uv export --format requirements-txt > requirements.txt
- uv pip compile → uv sync (automatic dependency resolution)
- Virtual environment creation uses uv venv

### uv Extremely fast Python package manager
- curl -LsSf https://astral.sh/uv/install.sh | sh
- uv python list ; View Python Versions
- Make sure to restart your terminal afterwards to ensure that the uv command gets picked up.
- uv venv .venvuv3.13 --python 3.13
- uv venv .venvuv3.11 --python 3.11
- uv pip install -r requirements.txt
- https://docs.astral.sh/uv/
- Drop-in parity with Flake8, isort, and Black
- https://docs.astral.sh/ruff/
- pip install ruff
- uv tool install ruff@latest

