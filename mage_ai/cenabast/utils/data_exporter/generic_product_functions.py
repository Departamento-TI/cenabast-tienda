def create_or_update_generic_product(product, api_clients, general_data):
  # Get code (SKU)
  codigoProducto = product['codigoProducto']

  # Get generic product data from Spree API
  existing_generic_product = None
  api_response = api_clients['generic_products_client'].get_generic_product_data(codigoProducto)
  api_results = api_response.get('results', [])
  if isinstance(api_results, list) and len(api_results) > 0:
    existing_generic_product = api_results[0]
  
  # Prepare payload with product information
  payload = build_generic_product_payload(product)

  # Generic product will store the created or updated record
  generic_product = None
  if existing_generic_product:
    # Compare payload with existing data and update if necessary
    # Only compare shared keys (dont consider id, created_at... etc)
    filtered_attributes = {key: value for key, value in existing_generic_product.items() if key in payload.keys()}
    if payload != filtered_attributes:
      print(f"Generic product {codigoProducto} needs update, updating.")
      generic_product = api_clients['generic_products_client'].update_generic_product(existing_generic_product['id'], payload)
    else:
      generic_product = existing_generic_product
      print(f"No changes for generic product {codigoProducto}, no update needed")
  else:
    # Create product
    print(f"Generic product {codigoProducto} didnt exist, creating.")
    generic_product = api_clients['generic_products_client'].create_generic_product(payload)
    print(f"Created new generic product {codigoProducto}")

  return generic_product

def build_generic_product_payload(product):
  return {
    "product_type": 'generic',
    "code": product['codigoProducto'],
    "code_atc": product['codigoATC'],
    "code_onu": product['codigoONU'],
    "code_ean": product['codigoEAN'],
    "denomination": product['denominacion'],
    "standard_denomination": product['denominacionEstandar'],
    "hierarchy": product['jerarquia'],
    "ump": product['ump'],
    "manufacturer": product['fabricante'],
    "base_table": product['tablaBase'],
  }
