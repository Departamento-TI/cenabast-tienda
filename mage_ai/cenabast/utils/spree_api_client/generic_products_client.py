from urllib.parse import urlencode
from .base_client import BaseClient

class GenericProductsClient(BaseClient):
  def generic_products_url(self):
    return self.spree_api_base_url() + "/api/v2/platform/generic_products"

  def parse_generic_products(self, generic_product_data):
    generic_products = generic_product_data.get('data', [])

    info_list = []
    for generic_product in generic_products:
      info_list.append(self.parse_generic_product(generic_product))

    return info_list

  def parse_generic_product(self, generic_product):
    if isinstance(generic_product, dict) and generic_product.get('data') != None:
      generic_product = generic_product.get('data', {})

    attributes = generic_product.get('attributes', {})
    return {
      'id': generic_product.get('id'),
      'name': attributes.get('name'),
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

  # Get an specific product by its code
  def get_generic_product_data(self, code):
    params = [
      ('filter[code_eq]', code)
    ]
    url_with_params = f"{self.generic_products_url()}?{urlencode(params)}"
    response = self.make_authenticated_request("GET", url_with_params, self.get_token())
    return self.parse_response(response, self.parse_generic_products)

  def create_generic_product(self, payload):
    url = self.generic_products_url()
    final_payload = {
      'generic_product': payload
    }
    response = self.make_authenticated_request("POST", url, self.get_token(), final_payload)
    return self.parse_response(response, self.parse_generic_product)

  def update_generic_product(self, id, payload):
    url = f"{self.generic_products_url()}/{id}"
    final_payload = {
      'generic_product': payload
    }
    response = self.make_authenticated_request("PUT", url, self.get_token(), final_payload)
    return self.parse_response(response, self.parse_generic_product)