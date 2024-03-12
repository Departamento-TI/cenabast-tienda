from urllib.parse import urlencode
from .base_client import BaseClient

class PropertiesClient(BaseClient):
  def properties_url(self):
    return self.spree_api_base_url() + "/api/v2/platform/properties"

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

  # Get needed properties
  def get_properties_data(self):
    params = [
      ('filter[name_in][]', 'unit-venta'),
      ('filter[name_in][]', 'unit')
    ]
    url_with_params = f"{self.properties_url()}?{urlencode(params)}"
    response = self.make_authenticated_request("GET", url_with_params, self.get_token())
    return self.parse_response(response, self.parse_properties)
