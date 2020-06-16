if poetry --version >/dev/null; then
    echo "poetry installed"
else
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
fi