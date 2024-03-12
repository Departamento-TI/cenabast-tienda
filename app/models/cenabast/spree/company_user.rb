class Cenabast::Spree::CompanyUser < Spree::Base
  belongs_to :user, class_name: "::#{Spree.user_class}", optional: false
  belongs_to :company, class_name: 'Cenabast::Spree::Company', optional: false
end
