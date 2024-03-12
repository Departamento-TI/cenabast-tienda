require 'rails_helper'

RSpec.describe Cenabast::Spree::GenericProduct, type: :model do
  describe 'associations' do
    it { should have_many(:products).class_name('Spree::Product').dependent(:nullify) }
  end

  describe 'Enums' do
    it { is_expected.to define_enum_for(:product_type).with_values(generic: 0, contract: 1) }
  end
end
