from urllib.parse import urlencode
from .base_client import BaseClient

class VendorsClient(BaseClient):
  def vendors_url(self):
    return self.spree_api_base_url() + "/api/v2/platform/vendors"

  def parse_vendors(self, vendors_data):
    vendors = vendors_data.get('data', [])

    info_list = []
    for vendor in vendors:
      info_list.append(self.parse_vendor(vendor))

    return info_list

  def parse_vendor(self, vendor):
    if isinstance(vendor, dict) and vendor.get('data') != None:
      vendor = vendor.get('data', {})

    attributes = vendor.get('attributes', [])

    return {
      'id': vendor.get('id'),
      'name': attributes.get('name'),
      'state': attributes.get('state'),
      'slug': attributes.get('slug'),
      'about_us': attributes.get('about_us'),
      'contact_us': attributes.get('contact_us'),
      'commission_rate': attributes.get('commission_rate'),
      'priority': attributes.get('priority'),
      'notification_email': attributes.get('notification_email'),
      'run': attributes.get('run'),
      'first_name': attributes.get('first_name'),
      'last_name': attributes.get('last_name'),
      'email': attributes.get('email'),
      'land_phone': attributes.get('land_phone'),
      'mobile_phone': attributes.get('mobile_phone')
    }

  # Get an specific vendor by its run
  def get_vendor_data(self, run):
    params = [
      ('filter[run_eq]', run)
    ]
    url_with_params = f"{self.vendors_url()}?{urlencode(params)}"
    response = self.make_authenticated_request("GET", url_with_params, self.get_token())
    return self.parse_response(response, self.parse_vendors)

  def create_vendor(self, payload):
    url = self.vendors_url()
    final_payload = {
      'vendor': payload
    }
    response = self.make_authenticated_request("POST", url, self.get_token(), final_payload)
    return self.parse_response(response, self.parse_vendor)

  def update_vendor(self, id, payload):
    url = f"{self.vendors_url()}/{id}"
    final_payload = {
      'vendor': payload
    }
    response = self.make_authenticated_request("PUT", url, self.get_token(), final_payload)
    return self.parse_response(response, self.parse_vendor)