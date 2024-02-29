require 'rails_helper'

RSpec.describe Cenabast::Spree::GenericProduct, type: :model do
  describe 'associations' do
    it { should have_many(:products).class_name('Spree::Product').dependent(:nullify) }
  end
end
