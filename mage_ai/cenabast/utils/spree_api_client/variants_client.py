from urllib.parse import urlencode
from .base_client import BaseClient

class VariantsClient(BaseClient):
  def variants_url(self):
    return self.spree_api_base_url() + "/api/v2/platform/variants"

  def parse_variants(self, variant_data):
    variants = variant_data.get('data', [])

    info_list = []
    for variant in variants:
      info_list.append(self.parse_variant(variant))

    return info_list

  def parse_variant(self, variant):
    attributes = variant.get('attributes', {})

    return {
      'id': variant.get('id'),
      'sku': attributes.get('sku'),
      'weight': attributes.get('weight'),
      'height': attributes.get('height'),
      'depth': attributes.get('depth'),
      'deleted_at': attributes.get('deleted_at'),
      'is_master': attributes.get('is_master'),
      'cost_price': attributes.get('cost_price'),
      'position': attributes.get('position'),
      'cost_currency': attributes.get('cost_currency'),
      'track_inventory': attributes.get('track_inventory'),
      'updated_at': attributes.get('updated_at'),
      'discontinue_on': attributes.get('discontinue_on'),
      'created_at': attributes.get('created_at'),
      'public_metadata': attributes.get('public_metadata'),
      'private_metadata': attributes.get('private_metadata'),
      'barcode': attributes.get('barcode'),
      'display_price': attributes.get('display_price'),
      'display_compare_at_price': attributes.get('display_compare_at_price'),
      'name': attributes.get('name'),
      'options_text': attributes.get('options_text'),
      'total_on_hand': attributes.get('total_on_hand'),
      'purchasable': attributes.get('purchasable'),
      'in_stock': attributes.get('in_stock'),
      'backorderable': attributes.get('backorderable'),
      'available': attributes.get('available'),
      'currency': attributes.get('currency'),
      'price': attributes.get('price'),
      'compare_at_price': attributes.get('compare_at_price'),
    }

  # Get an specific product by its sku
  def get_variant_data(self, code):
    params = [
      ('filter[sku_cont]', code)
    ]
    url_with_params = f"{self.variants_url()}?{urlencode(params)}"
    response = self.make_authenticated_request("GET", url_with_params, self.get_token())
    return self.parse_response(response, self.parse_variants)

  def create_variant(self, payload):
    url = self.variants_url()
    final_payload = {
      'variant': payload
    }
    response = self.make_authenticated_request("POST", url, self.get_token(), final_payload)
    return self.parse_response(response, self.parse_variants)

  def update_variant(self, id, payload):
    url = f"{self.variants_url()}/{id}"
    final_payload = {
      'variant': payload
    }
    response = self.make_authenticated_request("PUT", url, self.get_token(), final_payload)
    return self.parse_response(response, self.parse_variants)