## setup

You need:
1. Python 3.x
If your default is not python 3.x, then follow the next steps:
- brew install pyenv
- pyenv install 3.6.0
- pyenv global 3.6.0
- pyenv version #to verify version is installed


- curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
- export PATH="$HOME/.poetry/bin:$PATH"

To install dependencies
```
make setup
```

To run project
```
make run
```

To run tests
```
make test
```