.PHONY: setup test lint run test-dev

#################################################################################
# GLOBALS                                                                       #
#################################################################################


PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PROFILE = default
PROJECT_NAME = poetry-example
PYTHON_INTERPRETER = python3

# Alias python paths
POETRY_PYTHON := poetry run python
POETRY_PYTEST := poetry run pytest
POETRY_LINTER := poetry run flake8
#################################################################################
# COMMANDS                                                                      #
#################################################################################

# Makefile chains the operations so setup -> lint -> test -> run

setup:
	# $(PYTHON_INTERPRETER) -m pip install  --upgrade pip
	# bash shell_scripts/install_pyenv.sh
	# pyenv install 3.7.4
	# pyenv local 3.7.4
	curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
	poetry update
	poetry install


lint:
	$(POETRY_LINTER) .

# test (requires) lint
test: lint
	$(POETRY_PYTEST) tests/

run:
	$(POETRY_PYTHON) src/main.py

