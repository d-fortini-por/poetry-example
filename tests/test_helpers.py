from src.helpers import get_true
import pandas as pd
import numpy as np


def test_pandas():
    df = pd.DataFrame({})
    assert df.empty


def test_fun():
    assert get_true()


def test_fails():
    expected_result = 1
    result = 2
    assert expected_result == result
