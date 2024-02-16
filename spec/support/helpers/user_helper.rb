module Helpers
  module UserHelper
    def act_as_logged_in(user)
      allow_any_instance_of(Spree::StoreController).to receive(:spree_user_signed_in?).and_return(true)
      allow_any_instance_of(Spree::StoreController).to receive(:try_spree_current_user).and_return(user)
      allow_any_instance_of(Spree::StoreController).to receive_messages spree_current_user: user
    end
  end
end
