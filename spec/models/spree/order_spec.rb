require 'rails_helper'

RSpec.describe Spree::Order, type: :model do
  describe 'associations' do
    it { should belong_to(:receiver).class_name('Cenabast::Spree::Receiver') }
  end
end
