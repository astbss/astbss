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
- You may need to initialize a uv project first. Run:
- uv init --name shared-uv
- uv venv .venvuv3.13 --python 3.13
- uv venv .venvuv3.11 --python 3.11
- uv pip install -r requirements.txt
- https://docs.astral.sh/uv/
- Drop-in parity with Flake8, isort, and Black
- https://docs.astral.sh/ruff/
- pip install ruff
- uv tool install ruff@latest

# Create Shared venv in preferred location
```
# Create the shared venv in your preferred location
uv venv /home/are/.venvuv3.13 --python 3.13.5
source /home/are/.venvuv3.13/bin/activate
uv python pin 3.13

# In your project directory, create pyproject.toml pointing to shared venv
uv init --name shared-uv --python 3.13

# Configure uv to use the shared venv location
echo 'UV_PROJECT_ENVIRONMENT=/home/are/.venvuv3.13' >> .env

# Or set it globally
export UV_PROJECT_ENVIRONMENT=/home/are/.venvuv3.13
echo $UV_PROJECT_ENVIRONMENT

# Now uv commands will use your shared venv
uv add flask fastapi typer rich
```
# Create new Shared venv from pyproject.toml
```
cd your pyproject.toml folder
uv venv /home/are/.venvtest3.13 --python 3.13.5
source /home/are/.venvtest3.13/bin/activate
# use uv sync `--active` to target the active environment
uv sync --active
```
