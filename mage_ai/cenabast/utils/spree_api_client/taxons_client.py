from urllib.parse import urlencode
from .base_client import BaseClient

class TaxonsClient(BaseClient):
  def taxons_url(self):
    return self.spree_api_base_url() + "/api/v2/platform/taxons"

  def parse_taxons(self, taxons_data):
    taxons = taxons_data.get('data', [])

    info_list = []
    for taxon in taxons:
      attributes = taxon.get('attributes', {})
      taxon_info = {
        'id': taxon.get('id'),
        'name': attributes.get('name')
      }
      info_list.append(taxon_info)

    return info_list

  # Get parent taxon information
  def get_parent_taxons_data(self):
    params = [
      ('filter[name_in][]', 'Medicamentos'),
      ('filter[name_in][]', 'Farmacos'),
      ('filter[name_in][]', 'Insumos')
    ]
    url_with_params = f"{self.taxons_url()}?{urlencode(params)}"
    response = self.make_authenticated_request("GET", url_with_params, self.get_token())
    return self.parse_response(response, self.parse_taxons)
