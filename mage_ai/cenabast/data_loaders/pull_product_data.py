import os
import io
import pandas as pd
import requests
from urllib.parse import urlencode

if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test

@data_loader
def load_data_from_api(*args, **kwargs):
    """
    Template for loading data from API
    """
    # Get logger
    logger = kwargs.get('logger')

    # Get product sku for call payload
    product_sku = kwargs.get('product_sku')

    # Get token from API
    token = get_token(logger)
    # Get payload to use
    payload = products_payload(product_sku)
    # Get general product data
    product_data = get_product_data(token, payload, logger)

    # Filter unique products by 'codigoProducto' and
    # that codigoProducto is higher than 500016000
    already_added = set()
    filtered_products = [
        item for item in product_data['content']
        if item.get('codigoProducto')
        and int(item['codigoProducto']) > 500016000
        and item.get('codigoProducto') not in already_added
        and not already_added.add(item.get('codigoProducto'))
    ][:20]  # Take only the first 20 records

    # Get contract information for each unique product
    for product_info in filtered_products:
        codigo_producto = product_info['codigoProducto']
        contracts = get_contracts_data(token, codigo_producto, logger)
        product_info['contracts'] = contracts

    return filtered_products

def base_url():
    return os.environ['CENABAST_API_BASE_URL']

def parent_path_url():
    return os.environ['CENABAST_API_BASE_PATH']

def login_url():
    return f"{base_url()}{parent_path_url()}/auth"

def products_url():
    return f"{base_url()}{parent_path_url()}/materiales/listacatalogo"

def contracts_url(codigo_producto):
    return f"{base_url()}{parent_path_url()}/materiales/contratos/{codigo_producto}"

def products_payload(product_sku):
    if product_sku is not None:
        return {
            "tipoProducto": 'ZCEN',
            "codigoProducto": product_sku
        }
    else:
        return {
            "tipoProducto": 'ZCEN',
            'PageSize': 5_000_000
        }

def login_params():
    # Get login params from env
    return {
        "user": os.environ['CENABAST_API_USER'],
        "password": os.environ['CENABAST_API_PASSWORD']
    }

# Request functions

def get_token(logger=None):
    log_request_info(logger, "POST", login_url(), login_params())
    response = requests.post(login_url(), json=login_params())

    if response.status_code == 200:
        log_response_info(logger, response)
        return response.json().get("content")
    else:
        log_error_info(logger, response)
        raise Exception(f"Failed to obtain Cenabast API token. Status code: {response.status_code}, Response: {response.text}")

def get_product_data(token, payload, logger=None):
    url = products_url()
    url_with_params = f"{url}?{urlencode(payload)}"
    log_request_info(logger, "GET", url_with_params)
    headers = {
        "Authorization": f"Bearer {token}",
        "Content-Type": "application/json"
    }

    response = requests.get(url_with_params, headers=headers, json=payload)

    if response.status_code == 200:
        log_response_info(logger, response)
        return response.json()
    else:
        log_error_info(logger, response)
        raise Exception(f"Failed to obtain data. Status code: {response.status_code}, Response: {response.text}")

def get_contracts_data(token, codigo_producto, logger=None):
    url = contracts_url(codigo_producto)
    log_request_info(logger, "GET", url)
    headers = {
        "Authorization": f"Bearer {token}",
        "Content-Type": "application/json"
    }

    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        log_response_info(logger, response)
        return response.json().get("content")
    else:
        log_error_info(logger, response)
        raise Exception(f"Failed to obtain contract info. Status code: {response.status_code}, Response: {response.text}")

def log_request_info(logger, method, url, payload=None):
    if logger:
        logger.info(f"Making {method} request to {url} with payload: {payload}")
    else:
        module_logger.info(f"Making {method} request to {url} with payload: {payload}")

def log_response_info(logger, response):
    truncated_content = response.text[:4000]
    if logger:
        logger.info(f"Received response with status code {response.status_code} and content: {truncated_content}")
    else:
        module_logger.info(f"Received response with status code {response.status_code} and content: {truncated_content}")

def log_error_info(logger, response):
    truncated_content = response.text[:4000]
    if logger:
        logger.error(f"Request failed with status code {response.status_code} and response: {truncated_content}")
    else:
        module_logger.error(f"Request failed with status code {response.status_code} and response: {truncated_content}")