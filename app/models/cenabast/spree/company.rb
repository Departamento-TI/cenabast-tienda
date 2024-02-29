class Cenabast::Spree::Company < Spree::Base
  include Cenabast::Spree::HasRun

  has_many :company_users, class_name: 'Cenabast::Spree::CompanyUser', dependent: :destroy
  has_many :users, through: :company_users, class_name: "::#{Spree.user_class}"

  validates :name, presence: true
end
