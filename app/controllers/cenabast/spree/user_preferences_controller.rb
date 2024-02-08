module Cenabast
  module Spree
    class UserPreferencesController < ::Spree::StoreController
      before_action :find_store, only: [:toggle_store]

      def toggle_store
        spree_current_user&.toggle_store(@store)

        redirect_back fallback_location: spree.root_path
      end

      private

      def find_store
        @store = ::Spree::Store.find_by(id: params[:option_id] || params[:store_id])
      end
    end
  end
end
