def update_variant(contract, api_clients, general_data, variant_data):
  # Get code (SKU - ZCEN)
  code = contract['zcen']

  if variant_data['product'] == None:
    general_data['logger'].error(f"Product for Variant {code} does not exist or had an creation error, skipping master variant update")
    return

  # Get Variant data from Spree API
  existing_variant = None
  api_response = api_clients['variants_client'].get_variant_data(code)
  api_results = api_response.get('results', [])
  if isinstance(api_results, list) and len(api_results) > 0:
    existing_variant = api_results[0]

  # Prepare payload with Variant information
  payload = build_variant_payload(contract, general_data, variant_data)
  update_payload = build_filter_payload_update(payload)

  # Variant will store the created or updated record
  variant = None
  if existing_variant:
    # Compare payload with existing data and update if necessary
    filtered_attributes = {key: value for key, value in existing_variant.items() if key in update_payload.keys()}
    if update_payload != filtered_attributes:
      general_data['logger'].info(f"Variant ZCEN {code} needs update, updating.")
      general_data['logger'].debug(f"Variant payload to use: {update_payload}")
      api_response = api_clients['variants_client'].update_variant(existing_variant['id'], update_payload)
      variant = api_response.get('results', {})
    else:
      variant = existing_variant
      general_data['logger'].info(f"No changes for Variant ZCEN {code}, no update needed")
  else:
    general_data['logger'].error(f"Variant ZCEN {code} didnt exist and it should have existed, It will not be created.")

  return variant

def build_variant_payload(contract, general_data, variant_data):
  return {
    "sku": contract['zcen'],
    "currency": "CLP",
    "cost_currency": "CLP",
    "price": float(contract['valorTotal'])
  }

# Filter available_on/discontinue_on attributes on update
# This payload is also used for comparing the existing record vs the candidate one
def build_filter_payload_update(payload):
  allowed_keys = [
    'sku',
    'currency',
    'price'
  ]
  return {key: value for key, value in payload.items() if key not in allowed_keys }
