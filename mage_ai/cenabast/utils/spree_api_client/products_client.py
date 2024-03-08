from urllib.parse import urlencode
from .base_client import BaseClient

from .variants_client import VariantsClient
from .generic_products_client import GenericProductsClient
from .contracts_client import ContractsClient
from .product_properties_client import ProductPropertiesClient
from .classifications_client import ClassificationsClient

class ProductsClient(BaseClient):
  def __init__(self, token=None):
    super().__init__(token)
    self.variants_client = VariantsClient(token)
    self.generic_products_client = GenericProductsClient(token)
    self.contracts_client = ContractsClient(token)
    self.product_properties_client = ProductPropertiesClient(token)
    self.classifications_client = ClassificationsClient(token)

  def products_url(self):
    return self.spree_api_base_url() + "/api/v2/platform/products"

  def parse_products(self, products_data):
    products = products_data.get('data', [])
    included = products_data.get('included', {})

    info_list = []
    for product in products:
      attributes = product.get('attributes', {})
      relationships = product.get('relationships', {})

      stores = self.parse_relationship(relationships, 'stores')
      store_products = self.parse_relationship(relationships, 'store_products')
      vendor = self.parse_relationship(relationships, 'vendor')

      master_variant = self.parse_included(included, 'variant', self.variants_client.parse_variant)
      contract = self.parse_included(included, 'contract', self.contracts_client.parse_contract)
      generic_product = self.parse_included(included, 'generic_product', self.generic_products_client.parse_generic_product)
      product_properties = self.parse_included(included, 'product_property', self.product_properties_client.parse_product_property)
      classifications = self.parse_included(included, 'classification', self.classifications_client.parse_classification)

      product_info = {
        'id': product.get('id'),
        'name': attributes.get('name'),
        'description': attributes.get('description'),
        'available_on': attributes.get('available_on'),
        'slug': attributes.get('slug'),
        'meta_description': attributes.get('meta_description'),
        'meta_keywords': attributes.get('meta_keywords'),
        'updated_at': attributes.get('updated_at'),
        'sku': attributes.get('sku'),
        'barcode': attributes.get('barcode'),
        'public_metadata': attributes.get('public_metadata'),
        'purchasable': attributes.get('purchasable'),
        'in_stock': attributes.get('in_stock'),
        'backorderable': attributes.get('backorderable'),
        'available': attributes.get('available'),
        'currency': attributes.get('currency'),
        'price': attributes.get('price'),
        'display_price': attributes.get('display_price'),
        'compare_at_price': attributes.get('compare_at_price'),
        'display_compare_at_price': attributes.get('display_compare_at_price'),
        'stores': stores,
        'store_products': store_products,
        'vendor': vendor,
        'master_variant': master_variant,
        'contract': contract,
        'generic_product': generic_product,
        'product_properties': product_properties,
        'classifications': classifications,
      }
      info_list.append(product_info)

    return info_list

  # Get an specific product by its master/primary variant SKU (SKU)
  def get_product_data(self, code):
    params = [
      ('filter[master_sku_eq]', code),
      ('include', 'primary_variant,taxons,store_products,contract,generic_product,classifications,product_properties')
    ]
    url_with_params = f"{self.products_url()}?{urlencode(params)}"
    response = self.make_authenticated_request("GET", url_with_params, self.get_token())
    return self.parse_response(response, self.parse_products)

  def create_product(self, payload):
    url = self.products_url()
    final_payload = {
      'product': payload
    }
    response = self.make_authenticated_request("POST", url, self.get_token(), final_payload)
    return self.parse_response(response, self.parse_products)

  def update_product(self, id, payload):
    url = f"{self.products_url()}/{id}"
    final_payload = {
      'product': payload
    }
    response = self.make_authenticated_request("PUT", url, self.get_token(), final_payload)
    return self.parse_response(response, self.parse_products)
