class Cenabast::Spree::CompanyUser < ApplicationRecord
  belongs_to :user, class_name: "::#{Spree.user_class}"
  belongs_to :company, class_name: 'Cenabast::Spree::Company'
end
