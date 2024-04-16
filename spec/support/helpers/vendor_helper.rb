module Helpers
  module VendorHelper
    def ensure_current_vendor(vendor)
      [Spree::StoreController, Spree::Admin::BaseController].each do |klass|
        allow_any_instance_of(klass).to receive(:current_spree_vendor).and_return(vendor)
      end
    end
  end
end
