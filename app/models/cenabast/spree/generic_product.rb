class Cenabast::Spree::GenericProduct < Spree::Base
  has_many :products, class_name: '::Spree::Product', dependent: :nullify

  enum product_type: { generic: 0, contract: 1 }

  validates :code, presence: true, uniqueness: true

  self.whitelisted_ransackable_attributes = %w[
    code code_atc code_onu code_ean denomination standard_denomination
    product_type hierarchy ump manufacturer base_table
  ]
end
