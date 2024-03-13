from urllib.parse import urlencode
from .base_client import BaseClient

class ContractsClient(BaseClient):
  def contracts_url(self):
    return self.spree_api_base_url() + "/api/v2/platform/contracts"

  def parse_contracts(self, contracts_data):
    contracts = contracts_data.get('data', [])

    info_list = []
    for contract in contracts:
      info_list.append(self.parse_contract( contract))

    return info_list

  def parse_contract(self, contract):
    if isinstance(contract, dict) and contract.get('data') != None:
      contract = contract.get('data', {})

    attributes = contract.get('attributes', {})
    product_id = contract.get('relationships').get('product').get('data').get('id')
    return {
      'id': contract.get('id'),
      'product_id': product_id,
      'sale_order': attributes.get('sale_order'),
      'code': attributes.get('code'),
      'name': attributes.get('name'),
      'available_on': attributes.get('available_on'),
      'discontinue_on': attributes.get('discontinue_on'),
      'mercado_publico_id': attributes.get('mercado_publico_id'),
      'mercado_publico_oc': attributes.get('mercado_publico_oc'),
      'center': attributes.get('center'),
      'price_before_iva': float(attributes.get('price_before_iva')),
      'price_iva': float(attributes.get('price_iva')),
      'price': float(attributes.get('price')),
      'comission': float(attributes.get('comission')),
      'unit_sale': attributes.get('unit_sale'),
      'unit': attributes.get('unit'),
      'quantity': int(attributes.get('quantity')),
    }

  # Get an specific product by its code (SKU)
  def get_contract_data(self, code):
    params = [
      ('filter[code_eq]', code)
    ]
    url_with_params = f"{self.contracts_url()}?{urlencode(params)}"
    response = self.make_authenticated_request("GET", url_with_params, self.get_token())
    return self.parse_response(response, self.parse_contracts)

  def create_contract(self, payload):
    url = self.contracts_url()
    final_payload = {
      'contract': payload
    }
    response = self.make_authenticated_request("POST", url, self.get_token(), final_payload)
    return self.parse_response(response, self.parse_contract)

  def update_contract(self, id, payload):
    url = f"{self.contracts_url()}/{id}"
    final_payload = {
      'contract': payload
    }
    response = self.make_authenticated_request("PUT", url, self.get_token(), final_payload)
    return self.parse_response(response, self.parse_contract)
