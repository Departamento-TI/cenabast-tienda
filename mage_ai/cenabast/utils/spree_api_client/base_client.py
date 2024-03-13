import os
import requests

class BaseClient:
  def __init__(self, token=None, logger=None):
    self.token = token
    self.logger = logger

  # Url methods
  def spree_api_base_url(self):
    return os.environ['SPREE_API_BASE_URL']

  def auth_url(self):
    return self.spree_api_base_url() + "/spree_oauth/token"

  # Function to make authenticated requests
  def make_authenticated_request(self, method, url, token=None, data=None):
    self.logger.debug(f"[SpreeApiClient] Making authenticated request to {url}, http_method: {method}")

    headers = {
      "Authorization": f"Bearer {token}",
      "Content-Type": "application/json",
    }

    if method == "GET":
      response = requests.get(url, headers=headers)
    elif method == "POST":
      response = requests.post(url, headers=headers, json=data)
    elif method == "PUT":
      response = requests.put(url, headers=headers, json=data)
    else:
      self.logger.error(f"[SpreeApiClient] Unsupported HTTP method: {method}")
      raise ValueError(f"[SpreeApiClient] Unsupported HTTP method: {method}")

    self.logger.debug(f"URL: {url} Status Code: {response.status_code}")
    return response

  # Parsing methods
  # parse_func is a func defined by each subclient that
  # knows how to parse a particular model/model collection
  def parse_response(self, response, parse_func):
    if response.status_code not in {200, 201, 301}:
      return self.parse_error(response)
    else:
      results = parse_func(response.json())
      return self.parse_success(response, results)

  def parse_error(self, response):
    payload = {
      'status_code': response.status_code,
      'error': response.json().get('error', [])
    }
    self.logger.error(f"[SpreeApiClient][parse_error]: Error payload: {payload}")
    raise ValueError(f"[SpreeApiClient][parse_error]: Error payload: {payload}")
    return payload

  def parse_success(self, response, results):
    payload = {
      'status_code': response.status_code,
      'raw_data': response,
      'results': results,
    }
    self.logger.debug(f"[SpreeApiClient][parse_success]: Payload to return: {payload}")
    return payload

  # Helper to handle parsing of the "relationships"
  # collection of an Spree Api response
  def parse_relationship(self, relationships, key):
    return relationships.get(key, {}).get('data', None)

  # Helper to handle parsing of the "included"
  # collection of an Spree Api response
  def parse_included(self, included, key, parse_func):
    results = (item for item in included if item.get('type') == key)
    info_list = []
    for result in results:
      info_list.append(parse_func(result))

    return info_list

  # Obtain token helper
  def get_token(self):
    # If token is already generated, return it
    if self.token:
      return self.token

    payload = {
      "grant_type": "client_credentials",
      "client_id": os.environ['SPREE_CLIENT_ID'],
      "client_secret": os.environ['SPREE_CLIENT_SECRET'],
      "scope": "admin"
    }
    self.logger.debug(f"[SpreeApiClient][get_token] self.auth_url(): {self.auth_url()}")
    self.logger.debug(f"[SpreeApiClient][get_token] Token payload: {payload}")
    response = requests.post(self.auth_url(), data=payload)
    json_response = response.json()
    self.token = json_response.get('access_token')

    return self.token
