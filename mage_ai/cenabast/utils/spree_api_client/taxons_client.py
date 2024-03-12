from urllib.parse import urlencode
from .base_client import BaseClient

class TaxonsClient(BaseClient):
  def taxons_url(self):
    return self.spree_api_base_url() + "/api/v2/platform/taxons"

  def parse_taxons(self, taxons_data):
    taxons = taxons_data.get('data', [])

    info_list = []
    for taxon in taxons:
      info_list.append(self.parse_taxon(taxon))

    return info_list

  def parse_taxon(self, taxon):
    if isinstance(taxon, dict) and taxon.get('data') != None:
      taxon = taxon.get('data', {})

    attributes = taxon.get('attributes', {})
    relationships = taxon.get('relationships', {})

    parent_id = self.parse_relationship(relationships, 'parent').get('id')
    return {
      'id': taxon.get('id'),
      'name': attributes.get('name'),
      'parent_id': parent_id,
    }

  # Get parent taxon information
  def get_parent_taxons_data(self):
    params = [
      ('filter[name_in][]', 'Medicamentos'),
      ('filter[name_in][]', 'Fármacos'),
      ('filter[name_in][]', 'Insumos')
    ]
    url_with_params = f"{self.taxons_url()}?{urlencode(params)}"
    response = self.make_authenticated_request("GET", url_with_params, self.get_token())
    return self.parse_response(response, self.parse_taxons)

  # Get taxon information matching name and parent id
  def get_taxon_data(self, name, parent_id):
    params = [
      ('filter[name_eq]', name),
      ('filter[parent_id_eq]', parent_id)
    ]
    url_with_params = f"{self.taxons_url()}?{urlencode(params)}"
    response = self.make_authenticated_request("GET", url_with_params, self.get_token())
    return self.parse_response(response, self.parse_taxons)


  def create_taxon(self, payload):
    url = self.taxons_url()
    final_payload = {
      'taxon': payload
    }
    response = self.make_authenticated_request("POST", url, self.get_token(), final_payload)
    return self.parse_response(response, self.parse_taxon)

  def update_taxon(self, id, payload):
    url = f"{self.taxons_url()}/{id}"
    final_payload = {
      'taxon': payload
    }
    response = self.make_authenticated_request("PUT", url, self.get_token(), final_payload)
    return self.parse_response(response, self.parse_taxon)
