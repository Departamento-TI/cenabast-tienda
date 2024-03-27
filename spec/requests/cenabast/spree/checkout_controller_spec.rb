require 'rails_helper'

RSpec.describe 'Spree::CheckoutController', type: :request do
  describe 'GET #edit' do
    let(:receiver) { create(:receiver) }
    let(:user) { create(:user, run: '88.888.888-8', receivers: [receiver]) }
    let(:order) { create(:order, state: :address) }

    before do
      allow_any_instance_of(Spree::CheckoutController).to receive(:set_cache_header)
      allow_any_instance_of(Spree::CheckoutController).to receive(:set_current_order)
      allow_any_instance_of(Spree::CheckoutController).to receive(:set_state_if_present).and_return(nil)
      allow_any_instance_of(Spree::CheckoutController).to receive(:ensure_order_not_completed).and_return(nil)
      allow_any_instance_of(Spree::CheckoutController).to receive(:ensure_checkout_allowed).and_return(nil)
      allow_any_instance_of(Spree::CheckoutController).to receive(:ensure_sufficient_stock_lines).and_return(nil)
      allow_any_instance_of(Spree::CheckoutController).to receive(:ensure_valid_state).and_return(nil)
      allow_any_instance_of(Spree::CheckoutController).to receive(:associate_user)
      allow_any_instance_of(Spree::CheckoutController).to receive(:check_authorization).and_return(nil)

      allow_any_instance_of(Spree::CheckoutController).to receive(:current_order).and_return(order)
      act_as_logged_in(user)
    end

    context 'when order meets minimum purchase per vendor' do
      xit 'renders the address page' do
        allow_any_instance_of(Cenabast::Spree::Order::FindLineItemStatsGroupedByVendor).to receive(:call).
          and_return(stats_per_vendor_double(valid_minimum_amount: true))

        get spree.checkout_state_path(order.state)

        expect(order.state).to eq('address')
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when order does not meet minimum purchase per vendor' do
      xit 'redirects to the cart page with an alert' do
        allow(Cenabast::Spree::Order::FindLineItemStatsGroupedByVendor).to receive(:call).
          and_return(stats_per_vendor_double(valid_minimum_amount: false))

        get spree.checkout_state_path(order.state)

        expect(order.state).to eq('cart')
        expect(response).to redirect_to(spree.cart_path)
        follow_redirect!

        expect(response.body).to include(Spree.t(:invalid_amount_per_vendor))
      end
    end
  end

  def stats_per_vendor_double(options = {})
    stats_double = []
    stats_double << { valid_minimum_amount: options.fetch(:valid_minimum_amount, true) }
    stats_double
  end
end
