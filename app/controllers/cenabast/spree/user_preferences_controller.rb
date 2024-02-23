module Cenabast
  module Spree
    class UserPreferencesController < ::Spree::StoreController
      before_action :find_requester, only: [:toggle_requester]
      before_action :find_receiver, only: [:toggle_receiver]
      before_action :find_store, only: [:toggle_store]

      def toggle_requester
        spree_current_user&.toggle_requester(@requester)

        redirect_back fallback_location: spree.root_path
      end

      def toggle_receiver
        spree_current_user&.toggle_receiver(@receiver)

        redirect_back fallback_location: spree.root_path
      end

      def toggle_store
        spree_current_user&.toggle_store(@store)

        redirect_back fallback_location: spree.root_path
      end

      private

      def find_requester
        @requester = Cenabast::Spree::Requester.find_by(id: params[:option_id] || params[:store_id])
      end

      def find_receiver
        @receiver = Cenabast::Spree::Receiver.find_by(id: params[:option_id] || params[:store_id])
      end

      def find_store
        @store = ::Spree::Store.find_by(id: params[:option_id] || params[:store_id])
      end
    end
  end
end
