import os
import io
import pandas as pd
import requests
from urllib.parse import urlencode

def get_products(*args, **kwargs):
  # Get logger
  logger = kwargs.get('logger')

  # Get token from API
  token = get_token(logger)
  # Get payload to use
  payload = products_payload(kwargs)
  logger.info(f"Using query params for product search {payload}")

  # Get general product data
  product_data = get_product_data(token, payload, logger)

  # Use hard filter of records to return
  max_number_of_products_to_process = kwargs.get('max_number_of_products_to_process')
  logger.info(f"Using max_number_of_products_to_process: {max_number_of_products_to_process}")

  # Codigo product range can be filtered down using
  # codigo_product_initial_range and codigo_product_final_range values
  codigo_product_initial_range = kwargs.get('codigo_product_initial_range')
  logger.info(f"Using codigo_product_initial_range: {codigo_product_initial_range}")

  codigo_product_final_range = kwargs.get('codigo_product_final_range')
  logger.info(f"Using codigo_product_final_range: {codigo_product_final_range}")

  # Filter unique products by 'codigoProducto' and
  # that codigoProducto is in ranges (if ranges are set)
  already_added = set()
  filtered_products = [
    item for item in product_data['content']
    if item.get('codigoProducto')
    and (codigo_product_initial_range == None or int(item['codigoProducto']) >= codigo_product_initial_range)
    and (codigo_product_final_range == None or int(item['codigoProducto']) <= codigo_product_final_range)
    and item.get('codigoProducto') not in already_added
    and not already_added.add(item.get('codigoProducto'))
  ] 

  if max_number_of_products_to_process != None:
    # Take only the first N records
    filtered_products = filtered_products[:max_number_of_products_to_process]

  logger.info("Fetching contract information")
  # Get contract information for each unique product
  for index, product_info in enumerate(filtered_products, start=1):
    codigo_producto = product_info['codigoProducto']
    logger.info(f"Processing product {index}/{len(filtered_products)} with codigoProducto {codigo_producto}")
    try:
      contracts = get_contracts_data(token, codigo_producto, logger)
      product_info['contracts'] = contracts
    except Exception as e:
      # Log the exception
      logger.error(f"Error processing product contract {codigo_producto}: {str(e)}")
      logger.error(traceback.format_exc())

  return filtered_products

# Url functions
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

def products_payload(kwargs):
  # Get logger
  logger = kwargs.get('logger')

  # Get product sku for call payload
  product_code = kwargs.get('product_code')

  if product_code is not None:
    # Individual product import
    # Fetch specific product sku
    logger.info(f"Individual product import, Fetch specific product sku: {product_code}")
    return {
      "tipoProducto": 'ZCEN',
      "codigoProducto": product_code
    }
  else:
    # General product import
    logger.info(f"General (grupal) product import")
    group_article = kwargs.get('group_article')
    sector_code = kwargs.get('sector_code')
    page_size = kwargs.get('page_size') or 5_000_000
    page_number = kwargs.get('page_number')
    payload = {
      "tipoProducto": 'ZCEN',
      'codigoSector': sector_code,
      'grupoArticulo': group_article,
      'PageSize': page_size,
      'PageNumber': page_number,
    }
    # Remove None values, return dict
    return {k: v for k, v in payload.items() if v is not None}

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
