class Cenabast::Spree::Receiver < Spree::Base
  include Cenabast::Spree::HasRun

  belongs_to :store, class_name: '::Spree::Store', optional: false
  belongs_to :requester, class_name: 'Cenabast::Spree::Requester', optional: false
  has_many :receiver_users, class_name: 'Cenabast::Spree::ReceiverUser', dependent: :destroy
  has_many :users, through: :receiver_users, class_name: "::#{Spree.user_class}"
  has_many :orders, dependent: :nullify

  enum channel_type: { intermediacion: 0, ecommerce: 1 }

  validates :name, presence: true

  def last_incomplete_spree_order(store, options = {})
    orders.where(store:).incomplete.
      includes(options[:includes]).
      order('created_at DESC').
      first
  end
end
