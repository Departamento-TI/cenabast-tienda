require 'rails_helper'

RSpec.describe Cenabast::Spree::Provider, type: :model do
  describe 'associations' do
    it { should have_many(:contracts).class_name('Cenabast::Spree::Contract').dependent(:destroy) }
  end
end
