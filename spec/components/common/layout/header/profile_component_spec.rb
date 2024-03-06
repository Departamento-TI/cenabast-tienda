# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Common::Layout::Header::ProfileComponent, type: :component do
  it 'renders component' do
    render_preview(:standard, params: { name: 'John Doe', email: 'example@spree.com' })

    name_span = page.find('[role="profile-user-name"]')
    expect(name_span).to have_content 'John Doe'

    name_span = page.find('[role="profile-user-email"]')
    expect(name_span).to have_content 'example@spree.com'

    expect(page).to have_css '[role="profile-user-image"]'
  end

  it 'renders component as guest' do
    render_preview(:standard, params: { is_logged_in: false })

    expect(page).to have_link(Spree.t(:login), href: spree.login_path)
  end

  it 'renders component as logged user' do
    render_preview(:standard, params: { is_logged_in: true })

    expect(page).not_to have_link(Spree.t(:login), href: spree.login_path)
    expect(page).to have_link(Spree.t(:my_account), href: spree.account_path)
    expect(page).to have_link(Spree.t(:cart), href: spree.cart_path)
    expect(page).to have_link(Spree.t(:logout), href: spree.logout_path)
  end
end
