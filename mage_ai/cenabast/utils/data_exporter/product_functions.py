from .date_functions import convert_date

def create_or_update_product(contract, api_clients, general_data, product_data):
  # product_data dict: generic_product, taxon, vendor
  # Get code (SKU)
  code = contract['zcen']

  # Get Product data from Spree API
  existing_product = None
  api_response = api_clients['products_client'].get_product_data(code)
  api_results = api_response.get('results', [])
  if isinstance(api_results, list) and len(api_results) > 0:
    existing_product = api_results[0]
  
  # Prepare payload with product information
  payload = build_product_payload(contract, general_data, product_data)
  update_payload = build_filter_payload_update(payload)

  # Product will store the created or updated record
  product = None
  if existing_product:
    # Compare payload with existing data and update if necessary
    # Only compare shared keys (dont consider id, created_at... etc)
    filtered_attributes = {key: value for key, value in existing_product.items() if key in update_payload.keys()}
    if update_payload != filtered_attributes:
      # Update is not very useful at the moment, as it doesnt really update much fields in the model.
      general_data['logger'].info(f"Product {code} needs update, updating.")
      api_response = api_clients['products_client'].update_product(existing_product['id'], update_payload)
      product = api_response.get('results', {})
    else:
      product = existing_product
      general_data['logger'].info(f"No changes for Product {code}, no update needed")
  else:
    # Create product
    general_data['logger'].info(f"Product {code} didnt exist, creating.")
    general_data['logger'].info(payload)
    api_response = api_clients['products_client'].create_product(payload)
    product = api_response.get('results', {})
    general_data['logger'].info(f"Created new Product {code}")

  return product

def build_product_payload(contract, general_data, product_data):
  stores_payload = build_stores_payload(general_data, product_data)
  classifications_payload = build_classifications_payload(general_data, product_data)

  return {
    "name": contract['nombreZCEN'],
    "sku": contract['zcen'],
    "available_on": convert_date(contract['fechaInicialContrato']),
    "discontinue_on": convert_date(contract['fechaFinalContrato']),
    "price": float(contract['valorTotal']),
    "shipping_category_id": 1,
    "status": "active",
    "store_products_attributes": stores_payload,
    "classifications_attributes": classifications_payload,
    "generic_product_id": product_data['generic_product']['id'],
    "vendor_id": product_data['vendor']['id']
  }

# Filter available_on/discontinue_on attributes on update
# This payload is also used for comparing the existing record vs the candidate one
def build_filter_payload_update(payload):
    not_allowed_keys = [
      'store_products_attributes',
      'classifications_attributes',
      'available_on',
      'discontinue_on',
      'sku',
      'shipping_category_id',
      'status',
      'generic_product_id',
      'vendor_id'
    ]
    filter_payload = {key: value for key, value in payload.items() if key not in not_allowed_keys }
    filter_payload['price'] = float(filter_payload['price'])
    return filter_payload

def build_classifications_payload(general_data, product_data):
  taxon = product_data['taxon']
  if taxon != None:
    return [{
      "taxon_id": taxon['id']
    }]
  else:
    return None

def build_stores_payload(general_data, product_data):
  stores_payload = []
  for store in general_data['stores']['results']:
    if store['code'] == 'spree-ecommerce':
      stores_payload.append({"store_id": int(store['id'])})

  return stores_payload
