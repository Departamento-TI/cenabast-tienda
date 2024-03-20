# Given an order, gets grouped line item stats by its vendor

module Cenabast
  module Spree
    module Order
      class FindLineItemStatsGroupedByVendor
        attr_accessor :order

        def initialize(order)
          @order = order
        end

        def call
          query.map do |record|
            {
              vendor_id: record.id,
              vendor_name: record.name,
              subtotal: record.subtotal
            }
          end
        end

        private

        def query
          ::Spree::Vendor.
            unscoped.
            reorder('').
            from("(#{query_inner}) AS vendor_stats").
            select('vendor_stats.subtotal, vendor_stats.name, vendor_stats.id')
        end

        def query_inner
          order.
            line_items.
            left_joins(variant: :vendor).
            reorder('').
            group('spree_variants.vendor_id, spree_vendors.name').
            select('SUM(spree_line_items.price * spree_line_items.quantity) as subtotal, spree_vendors.name as name, spree_variants.vendor_id as id').
            to_sql
        end
      end
    end
  end
end
