from .date_functions import convert_date

def create_or_update_spree_contract(contract, api_clients, general_data, spree_contract_data):
  # Get code (SKU - ZCEN)
  code = contract['zcen']

  if spree_contract_data['product'] == None:
    general_data['logger'].error(f"Product for contract {code} does not exist or had an creation error, skipping contract creation/update")
    return

  # Get Contract data from Spree API
  existing_contract = None
  api_response = api_clients['contracts_client'].get_contract_data(code)
  api_results = api_response.get('results', [])
  if isinstance(api_results, list) and len(api_results) > 0:
    existing_contract = api_results[0]
  
  # Prepare payload with contract information
  payload = build_contract_payload(contract, general_data, spree_contract_data)
  update_payload = build_filter_payload_update(payload)

  # Contract will store the created or updated record
  spree_contract = None
  if existing_contract:
    # Compare payload with existing data and update if necessary
    # Only compare shared keys (dont consider id, created_at... etc)
    filtered_attributes = {key: value for key, value in existing_contract.items() if key in update_payload.keys()}
    if update_payload != filtered_attributes:
      general_data['logger'].info(f"Contract ZCEN {code} needs update, updating.")
      general_data['logger'].debug(f"Contract payload to use: {update_payload}")
      spree_contract = api_clients['contracts_client'].update_contract(existing_contract['id'], update_payload)
    else:
      spree_contract = existing_contract
      general_data['logger'].info(f"No changes for Contract ZCEN {code}, no update needed")
  else:
    # Create contract
    general_data['logger'].info(f"Contract ZCEN {code} didnt exist, creating.")
    general_data['logger'].debug(f"Contract payload to use: {payload}")
    spree_contract = api_clients['contracts_client'].create_contract(payload)
    general_data['logger'].info(f"Created new Contract for ZCEN {code}")

  return spree_contract

def build_contract_payload(contract, general_data, spree_contract_data):
  return {
    "sale_order": contract['pedidoCompra'],
    "code": contract['zcen'],
    "name": contract['nombreZCEN'],
    "mercado_publico_id": contract['idMercadoPublico'],
    "mercado_publico_oc": contract['ocMercadoPublico'],
    "center": contract['centro'],
    "price_before_iva": float(contract['valorNeto']),
    "price_iva": float(contract['valorIVA']),
    "price": float(contract['valorTotal']),
    "comission": float(contract['valorComision']),
    "unit_sale": contract['unidadVenta'],
    "unit": contract['unidad'],
    "quantity": int(contract['cantidad']),
    "available_on": convert_date(contract['fechaInicialContrato']),
    "discontinue_on": convert_date(contract['fechaFinalContrato']),
    "product_id": spree_contract_data['product']['id']
  }

# Filter available_on/discontinue_on attributes on update
# This payload is also used for comparing the existing record vs the candidate one
def build_filter_payload_update(payload):
    not_allowed_keys = [
      'available_on',
      'discontinue_on',
    ]
    return {key: value for key, value in payload.items() if key not in not_allowed_keys }
