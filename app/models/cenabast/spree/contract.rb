class Cenabast::Spree::Contract < Spree::Base
  belongs_to :product, class_name: '::Spree::Product', optional: false
  belongs_to :provider, class_name: 'Cenabast::Spree::Provider', optional: false
end
