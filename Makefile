.PHONY: setup test lint run test-dev

#################################################################################
# GLOBALS                                                                       #
#################################################################################


PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PROFILE = default
PROJECT_NAME = etapbp-predictor
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
	$(PYTHON_INTERPRETER) -m pip install  --upgrade pip
	curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
	poetry update
	poetry install

# training_code is code used for the ML model that had too many false
# positives. It is not actively used in the current implementation.
lint:
	$(POETRY_LINTER) .

test: lint
	$(POETRY_PYTEST) tests/

run:
	$(POETRY_PYTHON) main.py

