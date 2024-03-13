def create_or_update_taxon(product, api_clients, general_data):
  # Get taxon data
  taxon_name = product['grupoArticulo']
  parent_taxon_name = product['descripcionSector']

  # Get parent ID
  parent_id = None
  for taxon in general_data['parent_taxons']['results']:
    if taxon['name'] == parent_taxon_name:
      parent_id = taxon['id']
      break
  
  # If for some reason, the parent taxon ID hasnt been found
  # Log and return
  if parent_id == None:
    general_data['logger'].error(f'Parent Taxon with {parent_taxon_name} hasnt been found, skipping creation/update of taxon {taxon_name}')
    return
  general_data['logger'].info(f'Parent Taxon found with id: {parent_id}')

  # Get generic taxon data from Spree API
  existing_taxon = None
  api_response = api_clients['taxons_client'].get_taxon_data(taxon_name, parent_id)
  api_results = api_response.get('results', [])
  if isinstance(api_results, list) and len(api_results) > 0:
    existing_taxon = api_results[0]
  
  # Prepare payload with taxon information
  payload = build_taxon_payload(product, parent_id)

  # taxon will store the created or updated record
  taxon = None
  if existing_taxon:
    # Compare payload with existing data and update if necessary
    # Only compare shared keys (dont consider id, created_at... etc)
    filtered_attributes = {key: value for key, value in existing_taxon.items() if key in payload.keys()}
    if payload != filtered_attributes:
      general_data['logger'].info(f"Taxon {taxon_name} needs update, updating.")
      api_response = api_clients['taxons_client'].update_taxon(existing_taxon['id'], payload)
      taxon = api_response.get('results', {})
    else:
      taxon = existing_taxon
      general_data['logger'].info(f"No changes for taxon {taxon_name}, no update needed")
  else:
    # Create taxon
    general_data['logger'].info(f"Taxon {taxon_name} didnt exist, creating.")
    api_response = api_clients['taxons_client'].create_taxon(payload)
    taxon = api_response.get('results', {})
    general_data['logger'].info(f"Created new taxon {taxon_name}")
  
  return taxon

def build_taxon_payload(product, parent_id):
  return {
    "name": product['grupoArticulo'],
    "parent_id": parent_id
  }