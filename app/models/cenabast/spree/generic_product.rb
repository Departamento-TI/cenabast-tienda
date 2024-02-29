class Cenabast::Spree::GenericProduct < Spree::Base
  has_many :products, class_name: '::Spree::Product', dependent: :nullify

  enum product_type: { generic: 0, contract: 1 }
end
