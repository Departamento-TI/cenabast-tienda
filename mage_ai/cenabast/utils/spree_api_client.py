import os
from urllib.parse import urlencode
import requests

class SpreeApiClient:
  def __init__(self):
    self.token = None

  def spree_api_base_url(self):
    return os.environ['SPREE_API_BASE_URL']

  # Url methods
  def auth_url(self):
    return self.spree_api_base_url() + "/spree_oauth/token"

  def stores_url(self):
    return self.spree_api_base_url() + "/api/v2/platform/stores"

  def taxons_url(self):
    return self.spree_api_base_url() + "/api/v2/platform/taxons"

  def properties_url(self):
    return self.spree_api_base_url() + "/api/v2/platform/properties"

  def generic_products_url(self):
    return self.spree_api_base_url() + "/api/v2/platform/generic_products"

  # Function to make authenticated requests
  def make_authenticated_request(self, method, url, token=None, data=None):
      headers = {
          "Authorization": f"Bearer {token}",
          "Content-Type": "application/json",
      }

      if method == "GET":
          response = requests.get(url, headers=headers)
      elif method == "POST":
          response = requests.post(url, headers=headers, json=data)
      elif method == "PUT":
          response = requests.put(url, headers=headers, json=data)
      else:
          raise ValueError(f"Unsupported HTTP method: {method}")

      print("URL", url, "Status Code ", response.status_code)

      return response

  # Parser methods
  def parse_response(self, response, parse_func):
    if response.status_code not in {200, 201, 301}:
      return self.parse_error(response)
    else:
      results = parse_func(response.json())
      return self.parse_success(response, results)

  def parse_error(self, response):
    return {
      'status_code': response.status_code,
      'error': response.json().get('error', [])
    }

  def parse_success(self, response, results):
    return {
      'status_code': response.status_code,
      'raw_data': response,
      'results': results,
    }

  def parse_stores(self, stores_data):
    stores = stores_data.get('data', [])
    info_list = []
    for store in stores:
        attributes = store.get('attributes', {})
        store_info = {
            'id': store.get('id'),
            'code': attributes.get('code')
        }
        info_list.append(store_info)

    return info_list

  def parse_taxons(self, taxons_data):
    taxons = taxons_data.get('data', [])

    info_list = []
    for taxon in taxons:
        attributes = taxon.get('attributes', {})
        taxon_info = {
            'id': taxon.get('id'),
            'name': attributes.get('name')
        }
        info_list.append(taxon_info)

    return info_list

  def parse_properties(self, properties_data):
    properties = properties_data.get('data', [])

    info_list = []
    for property_ in properties:
        attributes = property_.get('attributes', {})
        property_info = {
            'id': property_.get('id'),
            'name': attributes.get('name'),
            'presentation': attributes.get('presentation')
        }
        info_list.append(property_info)

    return info_list

  def parse_generic_product(self, generic_product_data):
    generic_products = generic_product_data.get('data', [])

    info_list = []
    for generic_product in generic_products:
        attributes = generic_product.get('attributes', {})
        info = {
            'id': generic_product.get('id'),
            'code': attributes.get('code'),
            'code_atc': attributes.get('code_atc'),
            'code_onu': attributes.get('code_onu'),
            'code_ean': attributes.get('code_ean'),
            'denomination': attributes.get('denomination'),
            'standard_denomination': attributes.get('standard_denomination'),
            'product_type': attributes.get('product_type'),
            'hierarchy': attributes.get('hierarchy'),
            'ump': attributes.get('ump'),
            'manufacturer': attributes.get('manufacturer'),
            'base_table': attributes.get('base_table'),
            'created_at': attributes.get('created_at'),
            'updated_at': attributes.get('updated_at')
        }
        info_list.append(info)

    return info_list[0]

  # Get methods
  def get_token(self):
      # If token is already generated, return it
      if self.token:
          return self.token

      payload = {
          "grant_type": "client_credentials",
          "client_id": os.environ['SPREE_CLIENT_ID'],
          "client_secret": os.environ['SPREE_CLIENT_SECRET'],
          "scope": "admin"
      }
      print("self.auth_url():", self.auth_url())
      print("payload:", payload)
      response = requests.post(self.auth_url(), data=payload)
      json_response = response.json()
      self.token = json_response.get('access_token')

      return self.token

  def get_stores_data(self):
      response = self.make_authenticated_request("GET", self.stores_url(), self.get_token())
      return self.parse_response(response, self.parse_stores)

  # Get parent taxon information
  def get_parent_taxons_data(self):
      params = [
        ('filter[name_in][]', 'Medicamentos'),
        ('filter[name_in][]', 'Farmacos'),
        ('filter[name_in][]', 'Insumos')
      ]
      url_with_params = f"{self.taxons_url()}?{urlencode(params)}"
      response = self.make_authenticated_request("GET", url_with_params, self.get_token())
      return self.parse_response(response, self.parse_taxons)

  # Get needed properties
  def get_properties_data(self):
      params = [
        ('filter[name_in][]', 'unit-venta'),
        ('filter[name_in][]', 'unit')
      ]
      url_with_params = f"{self.properties_url()}?{urlencode(params)}"
      response = self.make_authenticated_request("GET", url_with_params, self.get_token())
      return self.parse_response(response, self.parse_properties)

  # Get an specific product by its code
  def get_generic_product_data(self, code):
      params = [
        ('filter[code_eq]', code)
      ]
      url_with_params = f"{self.generic_products_url()}?{urlencode(params)}"
      response = self.make_authenticated_request("GET", url_with_params, self.get_token())
      return self.parse_response(response, self.parse_generic_product)

  def create_generic_product(self, payload):
      url = self.generic_products_url()
      final_payload = {
        'generic_product': payload
      }
      response = self.make_authenticated_request("POST", url, self.get_token(), final_payload)
      return self.parse_response(response, self.parse_generic_product)
