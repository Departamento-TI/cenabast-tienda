# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Login::LandingPageComponent, type: :component do
  it 'renders component' do
    render_preview(:standard)

    expect(page).to have_selector('[role="login-landing-page"]')
    expect(page).to have_selector('[role="login-logo"]')
    expect(page).to have_selector('[role="login-landing-background"]')

    expect(page).to have_link(href: spree.spree_user_clave_unica_omniauth_authorize_path)

    expect(page).to have_link(href: 'https://claveunica.gob.cl/recuperar')
    expect(page).to have_link(href: 'https://claveunica.gob.cl/sucursales')
  end
end
