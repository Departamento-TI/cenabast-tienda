class Cenabast::Spree::Contract < Spree::Base
  belongs_to :product, class_name: '::Spree::Product', optional: false

  validates :code, presence: true, uniqueness: true

  delegate :vendor, to: :product

  self.whitelisted_ransackable_attributes = %w[
    code name product_id sale_order mercado_publico_id mercado_publico_oc
    center price_before_iva price_iva price comission available_on discontinue_on
    unit_sale unit
  ]

  def self.json_api_columns
    super + ['mercado_publico_id', 'product_id']
  end

  def self.json_api_permitted_attributes
    super + ['mercado_publico_id', 'product_id']
  end
end
