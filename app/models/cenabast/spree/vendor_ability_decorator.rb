module Cenabast
  module Spree
    module VendorAbilityDecorator
      def initialize(user)
        super
        apply_current_store_permissions(user)
      end

      protected

      def apply_order_permissions
        cannot :create, ::Spree::Order

        order_scope = if ::Spree::Order.reflect_on_association(:vendor)
                        { commissions: { vendor_id: @vendor_ids } }
                      elsif ::Spree::LineItem.reflect_on_association(:vendor)
                        { line_items: { vendor_id: @vendor_ids } }
                      elsif ::Spree::Product.reflect_on_association(:vendor)
                        { line_items: { product: { vendor_id: @vendor_ids } } }
                      elsif ::Spree::Variant.reflect_on_association(:vendor)
                        { line_items: { variant: { vendor_id: @vendor_ids } } }
                      end

        if order_scope.present?
          can %i[admin show index edit update cart], ::Spree::Order, order_scope.merge(state: 'complete')
        else
          cannot_display_model(::Spree::Order)
        end
      end

      def apply_current_store_permissions(user)
        can :admin, ::Spree::Store, id: user.available_stores.pluck(:id)
      end
    end
  end
end

def decorator_excluded?
  Spree::VendorAbility.included_modules.exclude?(Cenabast::Spree::VendorAbilityDecorator)
end

Spree::VendorAbility.prepend Cenabast::Spree::VendorAbilityDecorator if decorator_excluded?
