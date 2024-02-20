class Cenabast::Spree::Reciever < ApplicationRecord
  belongs_to :requester, class_name: 'Cenabast::Spree::Requester'
  has_many :reciever_users, class_name: 'Cenabast::Spree::RecieverUser', dependent: :destroy
  has_many :users, through: :reciever_users, class_name: "::#{Spree.user_class}"

  enum channel_type: { intermediacion: 0, ecommerce: 1 }
end
