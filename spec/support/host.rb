RSpec.configure do |config|
  config.before(:each, type: :request) do
    host! 'localhost:4000'
  end
end
