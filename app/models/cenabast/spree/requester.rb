class Cenabast::Spree::Requester < ApplicationRecord
  has_many :recievers, class_name: 'Cenabast::Spree::Reciever', dependent: :destroy
end
