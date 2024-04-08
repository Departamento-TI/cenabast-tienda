RSpec.configure do |config|
  config.before(:each, type: :component) do
    create_cenabast_stores
    @store = Spree::Store.first
    act_with_current_store(@store)
  end
end
