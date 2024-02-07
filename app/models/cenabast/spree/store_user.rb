class Cenabast::Spree::StoreUser < ApplicationRecord
  belongs_to :user, class_name: "::#{Spree.user_class}"
  belongs_to :store, class_name: 'Spree::Store'
end
