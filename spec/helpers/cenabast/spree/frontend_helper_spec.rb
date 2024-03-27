require 'rails_helper'

RSpec.describe Spree::FrontendHelper, type: :helper do
  describe '#cart_product_image_url' do
    let(:variant_with_image) { create(:with_image_variant) }
    let(:variant_without_image) { create(:variant) }

    it 'returns the URL of the product image if present' do
      expect(helper.cart_product_image_url(variant_with_image)).to include(main_app.cdn_image_url(variant_with_image.images.first.url(:small)))
    end

    it 'returns the URL of the default image if product image is not present' do
      expect(helper.cart_product_image_url(variant_without_image)).to include(asset_path('noimage/small'))
    end
  end
end
