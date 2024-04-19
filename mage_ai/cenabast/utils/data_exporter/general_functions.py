from cenabast.utils.spree_api_client.base_client import BaseClient
from cenabast.utils.spree_api_client.stores_client import StoresClient
from cenabast.utils.spree_api_client.taxons_client import TaxonsClient
from cenabast.utils.spree_api_client.properties_client import PropertiesClient
from cenabast.utils.spree_api_client.generic_products_client import GenericProductsClient
from cenabast.utils.spree_api_client.products_client import ProductsClient
from cenabast.utils.spree_api_client.contracts_client import ContractsClient
from cenabast.utils.spree_api_client.variants_client import VariantsClient
from cenabast.utils.spree_api_client.vendors_client import VendorsClient
from cenabast.utils.spree_api_client.stock_items_client import StockItemsClient
from cenabast.utils.spree_api_client.stock_locations_client import StockLocationsClient

def get_token(logger):
  # Get autentication token
  client = BaseClient(None, logger)
  token = client.get_token()
  logger.debug(f"token obtained: {token}")
  return token

def build_api_clients(token, logger):
  return {
    'generic_products_client': GenericProductsClient(token, logger),
    'stores_client': StoresClient(token, logger),
    'taxons_client': TaxonsClient(token, logger),
    'properties_client': PropertiesClient(token, logger),
    'vendors_client': VendorsClient(token, logger),
    'products_client': ProductsClient(token, logger),
    'contracts_client': ContractsClient(token, logger),
    'variants_client': VariantsClient(token, logger),
    'stock_items_client': StockItemsClient(token, logger),
    'stock_locations_client': StockLocationsClient(token, logger),
  }

def build_general_data(logger, api_clients):
  # Get general information about stores
  stores_client = api_clients['stores_client']
  stores = stores_client.get_stores_data()
  logger.debug(f"Stores: f{stores}")

  # Get information about (Product) properties to use
  properties_client = api_clients['properties_client']
  properties = properties_client.get_properties_data()
  logger.debug(f"Properties: {properties}")

  # Build needed information dicts
  return {
    'stores': stores,
    'properties': properties,
    'logger': logger,
    'success_count': 0,
    'error_count': 0,
    'error_products': []
  }
