require 'rails_helper'

RSpec.describe 'Checkout process', type: :system do
  let(:receiver) { create(:receiver) }
  let(:user) { create(:user, receivers: [receiver]) }
  let(:product) { create(:cenabast_product_in_stock, price: 500_000) }

  before(:each) do
    create_cenabast_stores
    create_states_and_counties
    create_shipping_methods

    store = Spree::Store.ecommerce
    store.update(default: true)
    receiver.update(store:)
    user.toggle_receiver(receiver)
    user.toggle_store(store)

    act_with_current_store(store)
    act_as_logged_in(user)

    # Dont do stock validation using API
    # Mock this, and return true always
    allow_any_instance_of(Cenabast::Spree::LineItemDecorator).to receive(:sufficient_stock?) { true }
  end

  it 'can go through checkout process', js: true do
    # Product page

    visit "/products/#{product.slug}"
    find_button(Spree.t(:add_to_cart), disabled: false)
    click_button Spree.t(:add_to_cart)

    expect(page).to have_text(Spree.t(:added_to_cart))
    click_link Spree.t('pdp.view_cart')

    # Cart view
    find_button(Spree.t(:send_order), disabled: false)
    click_button Spree.t(:send_order)

    expect(page).to have_text(Spree.t('checkout_page.header'))

    # Capture order, this will be used later
    order = Spree::Order.last

    # First step (Requester)

    fill_checkout_form_field Spree.t(:name_requester), 'Requester test'
    fill_in 'order[bill_address_attributes][run]', with: '22.021.220-3'
    fill_in 'order[bill_address_attributes][phone]', with: '981296396'
    fill_checkout_form_field Spree.t(:email), 'test.requester@acidlabs.com'
    fill_checkout_form_field Spree.t(:street), 'Fake Street'
    fill_checkout_form_field Spree.t(:number), '123'
    fill_checkout_form_field Spree.t(:office), 'A Office'

    select_checkout_form_field Spree.t(:region), 'Región Metropolitana de Santiago'
    page.find('.county-select').find('option', text: 'Renca')
    select_checkout_form_field Spree.t(:county), 'Renca'

    click_button Spree.t(:save_and_continue)

    # Second step (Receiver)

    fill_checkout_form_field Spree.t(:name_receiver), 'Receiver prueba'
    fill_in 'order[ship_address_attributes][run]', with: '3.040.162-K'
    fill_in 'order[ship_address_attributes][phone]', with: '962366219'
    fill_checkout_form_field Spree.t(:email), 'test.receiver@acidlabs.com'
    fill_checkout_form_field Spree.t(:street), 'Fake Street'
    fill_checkout_form_field Spree.t(:number), '123'
    fill_checkout_form_field Spree.t(:office), 'A Office'

    select_checkout_form_field Spree.t(:region), 'Región Metropolitana de Santiago'
    page.find('.county-select').find('option', text: 'Santiago')
    select_checkout_form_field Spree.t(:county), 'Santiago'

    click_button Spree.t(:save_and_continue)

    # Third step (Discharge port)

    selected_delivery_port = page.find('[name="order[selected_delivery_port]"]')
    expect(selected_delivery_port.value).to eq(order.reload.receiver.address)

    click_button Spree.t(:save_and_continue)

    # Fourth step (Discharge port)

    delivery_method_for_products_of_vendor = Spree.t(
      :delivery_method_for_products_of_vendor,
      name: order&.shipments&.first&.stock_location&.vendor&.name || Spree.t(:no_laboratory)
    )
    expect(page).to have_text(delivery_method_for_products_of_vendor)
    expect(page).to have_text(Spree::ShippingMethod.last.name)

    click_button Spree.t(:save_and_continue)

    # Finish screen

    expect(page).to have_text(Spree.t(:order_success))
    expect(page).to have_text(order.number)
    expect(order.reload.state).to eq('complete')
  end
end
