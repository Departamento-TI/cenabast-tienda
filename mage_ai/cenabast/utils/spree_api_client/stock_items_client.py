from urllib.parse import urlencode
from .base_client import BaseClient

class StockItemsClient(BaseClient):
  def stock_items_url(self):
    return self.spree_api_base_url() + "/api/v2/platform/stock_items"

  def parse_stock_items(self, stock_item_data):
    stock_items = stock_item_data.get('data', [])

    info_list = []
    for stock_item in stock_items:
      info_list.append(self.parse_stock_item(stock_item))

    return info_list

  def parse_stock_item(self, stock_item):
    if isinstance(stock_item, dict) and stock_item.get('data') != None:
      stock_item = stock_item.get('data', {})

    attributes = stock_item.get('attributes', {})

    return {
      'id': stock_item.get('id'),
      'count_on_hand': attributes.get('count_on_hand'),
      'backorderable': attributes.get('backorderable'),
      'deleted_at': attributes.get('deleted_at'),
      'is_available': attributes.get('is_available'),
      'created_at': attributes.get('created_at'),
      'updated_at': attributes.get('updated_at'),
    }

  # Get an specific product by its variant id and stock location id
  def get_stock_item_data(self, variant_id, stock_location_id):
    params = [
      ('filter[variant_id_eq]', variant_id),
      ('filter[stock_location_id_eq]', stock_location_id),
    ]
    url_with_params = f"{self.stock_items_url()}?{urlencode(params)}"
    response = self.make_authenticated_request("GET", url_with_params, self.get_token())
    return self.parse_response(response, self.parse_stock_items)

  def create_stock_item(self, payload):
    url = self.stock_items_url()
    final_payload = {
      'stock_item': payload
    }
    response = self.make_authenticated_request("POST", url, self.get_token(), final_payload)
    return self.parse_response(response, self.parse_stock_item)

  def update_stock_item(self, id, payload):
    url = f"{self.stock_items_url()}/{id}"
    final_payload = {
      'stock_item': payload
    }
    response = self.make_authenticated_request("PUT", url, self.get_token(), final_payload)
    return self.parse_response(response, self.parse_stock_item)
