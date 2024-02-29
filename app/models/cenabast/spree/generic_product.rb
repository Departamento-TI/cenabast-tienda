class Cenabast::Spree::GenericProduct < Spree::Base
  has_many :products, class_name: '::Spree::Product', dependent: :nullify
end
