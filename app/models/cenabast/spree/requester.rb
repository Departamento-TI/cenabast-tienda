class Cenabast::Spree::Requester < ApplicationRecord
  include Cenabast::Spree::HasRun

  has_many :receivers, class_name: 'Cenabast::Spree::Receiver', dependent: :destroy

  validates :name, presence: true
end
