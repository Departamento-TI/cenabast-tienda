RSpec.configure do |config|
  config.before(:suite) do
    # reindex models
    Spree::Variant.reindex

    # and disable callbacks
    Searchkick.disable_callbacks
  end

  config.around(:each, search: true) do |example|
    Searchkick.callbacks(nil) do
      example.run
    end
  end
end