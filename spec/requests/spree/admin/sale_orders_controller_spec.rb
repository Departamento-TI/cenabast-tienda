require 'rails_helper'

RSpec.describe Spree::Admin::SaleOrdersController, type: :request do
  let(:run) { Spree::User.raw_run_to_formatted(Faker::ChileRut.rut.to_s) }
  let(:user) { create(:admin_user, run:) }
  let(:vendor) { create(:vendor) }
  let!(:order) { create(:order_with_line_items) }
  let!(:sale_orders) { create_list(:erp_sale_order, rand(1..3), order:) }
  let!(:sale_order) { sale_orders.sample }

  before(:each) do
    act_as_logged_in(user)
    ensure_current_vendor(vendor)
  end

  describe '#index' do
    it 'shows a list with the numbers of every sale_order' do
      get spree.admin_order_sale_orders_path(order)

      sale_orders.each do |sale_order|
        expect(response.body).to include(sale_order.number)
      end
    end

    it 'if a order is sent, it will have button to nullify order' do
      sale_order.sent!
      get spree.admin_order_sale_orders_path(order)

      expect(response.body).to include(Spree.t('admin.orders.cancel_sale_order'))
    end

    it 'if a order not sent, it will not have button to nullify order' do
      get spree.admin_order_sale_orders_path(order)

      expect(response.body).not_to include(Spree.t('admin.orders.cancel_sale_order'))
    end
  end

  describe '#nullify' do
    before(:each) do
      @receive_count = 0

      allow_any_instance_of(Cenabast::Spree::Erp::SaleOrder).to receive(:cancel_in_erp!) do
        @receive_count += 1
      end
    end

    it 'calls cancel_in_erp!' do
      post spree.nullify_admin_order_sale_order_path(order, sale_order)

      expect(@receive_count).to eq 1
    end

    it 'redirects to index' do
      post spree.nullify_admin_order_sale_order_path(order, sale_order)

      expect(response).to redirect_to spree.admin_order_sale_orders_path(order)
    end

    it 'sets success flash with information' do
      sale_order.sent!
      post spree.nullify_admin_order_sale_order_path(order, sale_order)
      follow_redirect!

      message = Spree.t('admin.orders.nullify_sale_order_sent_message', number: sale_order.number)
      expect(flash[:success]).to eq(message)
    end
  end
end
