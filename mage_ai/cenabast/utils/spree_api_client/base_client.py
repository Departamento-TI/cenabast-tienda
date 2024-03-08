import os
import requests

class BaseClient:
  def __init__(self, token=None):
    self.token = token

  # Url methods
  def spree_api_base_url(self):
    return os.environ['SPREE_API_BASE_URL']

  def auth_url(self):
    return self.spree_api_base_url() + "/spree_oauth/token"

  # Function to make authenticated requests
  def make_authenticated_request(self, method, url, token=None, data=None):
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
      raise ValueError(f"Unsupported HTTP method: {method}")

    print("URL", url, "Status Code ", response.status_code)

    return response

  def parse_response(self, response, parse_func):
    if response.status_code not in {200, 201, 301}:
      return self.parse_error(response)
    else:
      results = parse_func(response.json())
      return self.parse_success(response, results)

  def parse_error(self, response):
    return {
      'status_code': response.status_code,
      'error': response.json().get('error', [])
    }

  def parse_success(self, response, results):
    return {
      'status_code': response.status_code,
      'raw_data': response,
      'results': results,
    }

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
    print("self.auth_url():", self.auth_url())
    print("payload:", payload)
    response = requests.post(self.auth_url(), data=payload)
    json_response = response.json()
    self.token = json_response.get('access_token')

    return self.token
