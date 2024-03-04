require 'rails_helper'

RSpec.describe Spree::Product, type: :model do
  describe 'associations' do
    it { should have_one(:contract).class_name('Cenabast::Spree::Contract').dependent(:destroy) }
    it { should belong_to(:generic_product).class_name('Cenabast::Spree::GenericProduct').optional }
    it { should belong_to(:vendor).class_name('Spree::Vendor').optional }
  end
end
