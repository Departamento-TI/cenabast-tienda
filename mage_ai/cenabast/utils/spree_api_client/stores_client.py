from .base_client import BaseClient

class StoresClient(BaseClient):
  def stores_url(self):
    return self.spree_api_base_url() + "/api/v2/platform/stores"

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

  def get_stores_data(self):
    response = self.make_authenticated_request("GET", self.stores_url(), self.get_token())
    return self.parse_response(response, self.parse_stores)
