require 'rails_helper'

RSpec.describe Cenabast::Spree::Contract, type: :model do
  describe 'associations' do
    it { should belong_to(:product).class_name('Spree::Product').optional(false) }
    it { should belong_to(:provider).class_name('Cenabast::Spree::Provider').optional(false) }
  end
end
