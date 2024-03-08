from .base_client import BaseClient

class ContractsClient(BaseClient):
  def contracts_url(self):
    return self.spree_api_base_url() + "/api/v2/platform/contracts"

  def parse_contracts(self, contracts_data):
    contracts = contracts_data.get('data', [])

    info_list = []
    for contract in contracts:
      attributes = contract.get('attributes', {})
      contract_info = {
        'id': contract.get('id'),
        'sale_order': attributes.get('sale_order'),
        'code': attributes.get('code'),
        'name': attributes.get('name'),
        'available_on': attributes.get('available_on'),
        'discontinue_on': attributes.get('discontinue_on'),
        'mercado_publico_oc': attributes.get('mercado_publico_oc'),
        'center': attributes.get('center'),
        'price_before_iva': attributes.get('price_before_iva'),
        'price_iva': attributes.get('price_iva'),
        'price': attributes.get('price'),
        'comission': attributes.get('comission'),
        'unit_sale': attributes.get('unit_sale'),
        'unit': attributes.get('unit')
      }
      info_list.append(contract_info)

    return info_list

  # Get an specific product by its code (SKU)
  def get_contract_data(self, code):
    params = [
      ('filter[code_eq]', code)
    ]
    url_with_params = f"{self.contracts_url()}?{urlencode(params)}"
    response = self.make_authenticated_request("GET", url_with_params, self.get_token())
    return self.parse_response(response, self.parse_contract)

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
