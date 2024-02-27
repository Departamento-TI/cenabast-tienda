class Cenabast::Spree::ReceiverUser < ApplicationRecord
  belongs_to :user, class_name: "::#{Spree.user_class}"
  belongs_to :receiver, class_name: 'Cenabast::Spree::Receiver'
end
