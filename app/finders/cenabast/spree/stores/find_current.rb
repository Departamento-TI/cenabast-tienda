# Based around the original
# Spree::Stores::FindCurrent
# Takes in consideration the spree_current_user for determining the current_store
# Instead of the url

module Cenabast
  module Spree
    module Stores
      class FindCurrent
        def initialize(scope: nil, current_user: nil)
          @scope = scope || ::Spree::Store
          @current_user = current_user
          # test
        end

        def execute
          by_current_user(scope) || scope.default
        end

        protected

        attr_reader :scope, :current_user

        def by_current_user(scope)
          return nil unless current_user
          return nil unless current_user&.available_stores&.any?

          scope.where(id: current_user.current_store&.id).first
        end
      end
    end
  end
end
