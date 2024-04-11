require 'vcr'
require 'webmock/rspec'
require 'uri'

driver_hosts = []

driver_hosts << 'codeclimate.com'
driver_hosts << 'elasticsearch'
driver_hosts << 'postgres'
driver_hosts << 'web'
driver_hosts << 'selenium'

WebMock.disable_net_connect!(allow_localhost: true, allow: [])

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = false
  c.cassette_library_dir = Rails.root.join('spec/vcr')
  c.hook_into :webmock
  c.ignore_localhost = true
  c.ignore_hosts(*driver_hosts)
  c.configure_rspec_metadata!
  c.default_cassette_options = { record: :new_episodes }
end
