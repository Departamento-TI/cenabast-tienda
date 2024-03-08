from urllib.parse import urlencode
from .base_client import BaseClient

class ProductPropertiesClient(BaseClient):
  # This client doesnt has methods,
  # Its only used for parsing product_property objects
  # in other responses

  def parse_product_properties(self, product_properties_data):
    product_properties = product_properties_data.get('data', [])

    info_list = []
    for product_property in product_properties:
      info_list.append(self.parse_product_property(product_property))

    return info_list

  def parse_product_property(self, product_property):
    attributes = product_property.get('attributes', {})

    return {
      'id': product_property.get('id'),
      'value': attributes.get('value'),
      'name': attributes.get('name'),
      'description': attributes.get('description'),
      'product_id': attributes.get('product_id'),
      'property_id': attributes.get('property_id'),
    }
