from urllib.parse import urlencode
from .base_client import BaseClient

class StockLocationsClient(BaseClient):
  def stock_locations_url(self):
    return self.spree_api_base_url() + "/api/v2/platform/stock_locations"

  def parse_stock_locations(self, stock_location_data):
    stock_locations = stock_location_data.get('data', [])

    info_list = []
    for stock_location in stock_locations:
      info_list.append(self.parse_stock_location(stock_location))

    return info_list

  def parse_stock_location(self, stock_location):
    if isinstance(stock_location, dict) and stock_location.get('data') != None:
      stock_location = stock_location.get('data', {})

    attributes = stock_location.get('attributes', {})

    return {
      'id': stock_location.get('id'),
      'name': attributes.get('name'),
      'created_at': attributes.get('created_at'),
      'updated_at': attributes.get('updated_at'),
      'default': attributes.get('default'),
      'address1': attributes.get('address1'),
      'address2': attributes.get('address2'),
      'city': attributes.get('city'),
      'state_name': attributes.get('state_name'),
      'zipcode': attributes.get('zipcode'),
      'phone': attributes.get('phone'),
      'active': attributes.get('active'),
      'backorderable_default': attributes.get('backorderable_default'),
      'propagate_all_variants': attributes.get('propagate_all_variants'),
      'admin_name': attributes.get('admin_name'),
    }

  # Get an specific product by its name
  def get_stock_location_data(self, name):
    params = [
      ('filter[name_eq]', name)
    ]
    url_with_params = f"{self.stock_locations_url()}?{urlencode(params)}"
    response = self.make_authenticated_request("GET", url_with_params, self.get_token())
    return self.parse_response(response, self.parse_stock_locations)

  def create_stock_location(self, payload):
    url = self.stock_locations_url()
    final_payload = {
      'stock_location': payload
    }
    response = self.make_authenticated_request("POST", url, self.get_token(), final_payload)
    return self.parse_response(response, self.parse_stock_location)

  def update_stock_location(self, id, payload):
    url = f"{self.stock_locations_url()}/{id}"
    final_payload = {
      'stock_location': payload
    }
    response = self.make_authenticated_request("PUT", url, self.get_token(), final_payload)
    return self.parse_response(response, self.parse_stock_location)
