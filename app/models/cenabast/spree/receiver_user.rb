class Cenabast::Spree::ReceiverUser < Spree::Base
  belongs_to :user, class_name: "::#{Spree.user_class}", optional: false
  belongs_to :receiver, class_name: 'Cenabast::Spree::Receiver', optional: false
end
