from urllib.parse import urlencode
from .base_client import BaseClient

class GenericProductsClient(BaseClient):
  def generic_products_url(self):
    return self.spree_api_base_url() + "/api/v2/platform/generic_products"

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
    # Return only the first element
    return info_list[0]

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

  def update_generic_product(self, id, payload):
    url = f"{self.generic_products_url()}/{id}"
    final_payload = {
      'generic_product': payload
    }
    response = self.make_authenticated_request("PUT", url, self.get_token(), final_payload)
    return self.parse_response(response, self.parse_generic_product)