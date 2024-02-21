class Cenabast::Spree::Receiver < ApplicationRecord
  include Cenabast::Spree::HasRun

  belongs_to :requester, class_name: 'Cenabast::Spree::Requester'
  has_many :receiver_users, class_name: 'Cenabast::Spree::ReceiverUser', dependent: :destroy
  has_many :users, through: :receiver_users, class_name: "::#{Spree.user_class}"

  enum channel_type: { intermediacion: 0, ecommerce: 1 }

  validates :name, presence: true
end
