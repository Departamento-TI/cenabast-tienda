class Cenabast::Spree::RecieverUser < ApplicationRecord
  belongs_to :user, class_name: "::#{Spree.user_class}"
  belongs_to :reciever, class_name: 'Spree::Reciever'
end
