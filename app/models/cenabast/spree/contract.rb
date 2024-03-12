class Cenabast::Spree::Contract < Spree::Base
  belongs_to :product, class_name: '::Spree::Product', optional: false

  validates :code, presence: true, uniqueness: true

  self.whitelisted_ransackable_attributes = %w[
    code name product_id provider_id sale_order mercado_publico_id mercado_publico_oc
    center price_before_iva price_iva price comission available_on discontinue_on
    unit_sale unit
  ]
end
