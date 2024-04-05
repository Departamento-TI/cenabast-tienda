require 'rails_helper'

RSpec.describe 'Spree::CheckoutController', type: :request do
  describe 'before_action :check_minimum_purchase_per_vendor' do
    let(:receiver) { create(:receiver) }
    let(:user) { create(:user, run: '88.888.888-8', receivers: [receiver]) }
    let(:order) { create(:order_with_line_items, state: :cart, receiver:) }

    before do
      allow_any_instance_of(Spree::CheckoutController).to receive(:current_order).and_return(order)
      act_as_logged_in(user)
    end

    context 'when order meets minimum purchase per vendor' do
      it 'renders the checkout page' do
        allow_any_instance_of(Cenabast::Spree::Order::FindLineItemStatsGroupedByVendor).to receive(:call).
          and_return(stats_per_vendor_double(valid_minimum_amount: true))

        get spree.checkout_path
        follow_redirect!

        expect(response).to have_http_status(:ok)
      end
    end

    context 'when order does not meet minimum purchase per vendor' do
      it 'redirects to the cart page with flash error' do
        allow_any_instance_of(Cenabast::Spree::Order::FindLineItemStatsGroupedByVendor).to receive(:call).
          and_return(stats_per_vendor_double(valid_minimum_amount: false))

        get spree.checkout_path
        follow_redirect!

        expect(order.state).to eq('cart')
        expect(response).to redirect_to(spree.cart_path)
        follow_redirect!

        expect(flash[:error]).to eq(Spree.t(:invalid_amount_per_vendor))
      end
    end
  end

  def stats_per_vendor_double(options = {})
    stats_double = []
    stats_double << { valid_minimum_amount: options.fetch(:valid_minimum_amount, true) }
    stats_double
  end
end
