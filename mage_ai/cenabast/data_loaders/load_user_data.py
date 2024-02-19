import os
import io
import pandas as pd
import requests

if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data_from_api(*args, **kwargs):
    """
    Template for loading data from API
    """
    run = kwargs['env']

    # Get token from API
    token = get_token()
    # Use token to get data
    return get_user_data('16338556', token)
    # return pd.read_csv(io.StringIO(response.text), sep=',')

def base_url():
    return "https://testaplicacionesweb.cenabast.cl:7001"

def login_url():
    return f"{base_url()}/interoperabilidad/servicios/v1/usuario/login"

def user_url(run):
    return f"{base_url()}/interoperabilidad/servicios/v1/tienda/establecimiento/usuario/{run}"

def login_params():
    # Get login params from env
    return {
        "user": os.environ['CENABAST_API_USER'],
        "password": os.environ['CENABAST_API_PASSWORD']
    }

def get_token():
    response = requests.post(login_url(), json=login_params())

    if response.status_code == 200:
        return response.json().get("token")
    else:
        raise Exception(f"Failed to obtain token. Status code: {response.status_code}, Response: {response.text}")

def get_user_data(run, token):
    headers = {
        "Authorization": f"Bearer {token}"
    }

    response = requests.get(user_url(run), headers=headers)

    if response.status_code == 200:
        return response.json()
    else:
        raise Exception(f"Failed to obtain data. Status code: {response.status_code}, Response: {response.text}")

@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
