# Docker and Python with uv

## Key changes:
- pip install → uv add
- pip freeze >requirements3.13.txt → uv export --format requirements-txt > requirements.txt
- uv pip compile → uv sync (automatic dependency resolution)
- Virtual environment creation uses uv venv

