def create_or_update_vendor(contract, api_clients, general_data):
  # Get vendor data
  vendor_run = contract['rutProveedor']

  # Get generic vendor data from Spree API
  existing_vendor = None
  api_response = api_clients['vendors_client'].get_vendor_data(vendor_run)
  api_results = api_response.get('results', [])
  if isinstance(api_results, list) and len(api_results) > 0:
    existing_vendor = api_results[0]
  
  # Prepare payload with vendor information
  payload = build_vendor_payload(contract)

  # vendor will store the created or updated record
  vendor = None
  if existing_vendor:
    # Compare payload with existing data and update if necessary
    # Only compare shared keys (dont consider id, created_at... etc)
    filtered_attributes = {key: value for key, value in existing_vendor.items() if key in payload.keys()}
    if payload != filtered_attributes:
      general_data['logger'].info(f"Vendor {vendor_run} needs update, updating.")
      general_data['logger'].debug(f"Vendor payload to use: {payload}")
      api_response = api_clients['vendors_client'].update_vendor(existing_vendor['id'], payload)
      vendor = api_response.get('results', {})
    else:
      vendor = existing_vendor
      general_data['logger'].info(f"No changes for vendor {vendor_run}, no update needed")
  else:
    # Create vendor
    general_data['logger'].info(f"Vendor {vendor_run} didnt exist, creating.")
    general_data['logger'].debug(f"Vendor payload to use: {payload}")
    api_response = api_clients['vendors_client'].create_vendor(payload)
    vendor = api_response.get('results', {})
    general_data['logger'].info(f"Created new vendor {vendor_run}")
  
  return vendor

def build_vendor_payload(contract):
  return {
    'name': contract['nombreProveedor'],
    'run': contract['rutProveedor'],
    'state': 'active'
  }