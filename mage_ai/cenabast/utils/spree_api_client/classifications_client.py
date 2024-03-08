from urllib.parse import urlencode
from .base_client import BaseClient

class ClassificationsClient(BaseClient):
  # This client doesnt has methods,
  # Its only used for parsing classification objects
  # in other responses

  def parse_classifications(self, classifications_data):
    classifications = classifications_data.get('data', [])

    info_list = []
    for classification in classifications:
      info_list.append(self.parse_classification(classification))

    return info_list

  def parse_classification(self, classification):
    attributes = classification.get('attributes', {})
    relationships = classification.get('relationships', {})

    product_id = self.parse_relationship(relationships, 'product').get('id')
    taxon_id = self.parse_relationship(relationships, 'taxon').get('id')
    return {
      'id': classification.get('id'),
      'position': attributes.get('position'),
      'product_id': product_id,
      'taxon_id': taxon_id,
    }
