class Cenabast::Spree::Provider < Spree::Base
  has_many :contracts, class_name: 'Cenabast::Spree::Contract', dependent: :destroy
end
