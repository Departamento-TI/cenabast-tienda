def create_or_update_stock_item(contract, api_clients, general_data, stock_item_data):
  if stock_item_data['variant'] == None:
    general_data['logger'].error(f"Variant for Stock Item does not exist or had an creation error, skipping stock_item creation/update")
    return

  # Get variant_id
  variant_id = stock_item_data['variant']['id']

  # Get stock location
  stock_location = None
  stock_location_name = contract['nombreProveedor']

  api_response = api_clients['stock_locations_client'].get_stock_location_data(stock_location_name)
  api_results = api_response.get('results', {})
  if isinstance(api_results, list) and len(api_results) > 0:
    stock_location  = api_results[0]

  # Get stock_location id
  stock_location_id = stock_location['id']

  if stock_location == None:
    general_data['logger'].error(f"StockLocation for Stock Item for variant id {variant_id} does not exist or had an creation error, skipping stock_item creation/update")
    return

  # Get Stock data from Spree API
  existing_stock_item = None
  api_response = api_clients['stock_items_client'].get_stock_item_data(variant_id, stock_location_id)
  api_results = api_response.get('results', [])
  if isinstance(api_results, list) and len(api_results) > 0:
    existing_stock_item = api_results[0]

  # Prepare payload with StockItem information
  payload = build_stock_item_payload(contract, general_data, stock_item_data, stock_location_id)
  filtered_payload = build_filter_payload_update(payload)

  # StockItem will store the created or updated record
  stock_item = None
  if existing_stock_item:
    # Compare payload with existing data and update if necessary
    # Only compare shared keys (dont consider id, created_at... etc)
    filtered_attributes = {key: value for key, value in existing_stock_item.items() if key in filtered_payload.keys()}
    if filtered_payload != filtered_attributes:
      general_data['logger'].info(f"StockItem for variant id {variant_id} needs update, updating.")
      general_data['logger'].debug(f"StockItem payload to use: {filtered_payload}")
      api_response = api_clients['stock_items_client'].update_stock_item(existing_stock_item['id'], filtered_payload)
      stock_item = api_response.get('results', {})
    else:
      stock_item = existing_stock_item
      general_data['logger'].info(f"No changes for variant id {variant_id}, no update needed")
  else:
    # Create stock_item
    general_data['logger'].info(f"StockItem for variant id {variant_id} didnt exist, creating.")
    general_data['logger'].debug(f"StockItem payload to use: {payload}")
    api_response = api_clients['stock_items_client'].create_stock_item(payload)
    stock_item = api_response.get('results', {})
    general_data['logger'].info(f"Created new StockItem for variant id {variant_id}")

  return stock_item

def build_stock_item_payload(contract, general_data, stock_item_data, stock_location_id):
  return {
    "backorderable": True,
    'variant_id': stock_item_data['variant']['id'],
    'stock_location_id': stock_location_id
  }

# Filter available_on/discontinue_on attributes on update
# This payload is also used for comparing the existing record vs the candidate one
def build_filter_payload_update(payload):
    not_allowed_keys = [
      'variant_id',
      'stock_location_id',
    ]
    return {key: value for key, value in payload.items() if key not in not_allowed_keys }
