require 'rails_helper'

RSpec.describe Cenabast::Spree::OmniauthCallbacksController, type: :request do
  before(:each) do
    create_cenabast_stores
  end

  describe '#passthru' do
    it 'redirects to clave unica provider URL' do
      post spree.spree_user_clave_unica_omniauth_authorize_path

      expect(response).to redirect_to %r(/realms/cenabast/protocol/openid-connect/auth)
      expect(response).to have_http_status(:redirect)
    end
  end

  describe '#clave_unica - buyer access' do
    before(:each) do
      VCR.insert_cassette 'cenabast/clave_unica/buyer_data'
    end

    after(:each) do
      VCR.eject_cassette
    end

    it 'valid user - redirects to root URL' do
      # Hardcoded params that were recorded into VCR
      get spree.spree_user_clave_unica_omniauth_callback_path, params: {
        state: '89ab0cab34b314e87f64b7f448aeec666c526b14bb1cb824',
        session_state: '0817cb9b-c6cc-4ab3-9c62-c2a7d389a5f9',
        code: 'e73df578-7c94-4fcd-9c58-8b74d1cb6e7e.0817cb9b-c6cc-4ab3-9c62-c2a7d389a5f9.e526ffce-229e-48d8-8f5e-4c8593ae0195'
      }

      expect(response).to redirect_to spree.root_path
      expect(response).to have_http_status(:redirect)
      expect(flash[:notice]).to eq(Spree.t(:success))
      expect(flash[:error]).to be_nil
    end
  end

  describe '#clave_unica - provider access' do
    before(:each) do
      VCR.insert_cassette 'cenabast/clave_unica/provider_data'
    end

    after(:each) do
      VCR.eject_cassette
    end

    it 'invalid user - redirects to new_spree_user_session_path and displays error' do
      # Hardcoded params that were recorded into VCR
      get spree.spree_user_clave_unica_omniauth_callback_path, params: {
        state: '89ab0cab34b314e87f64b7f448aeec666c526b14bb1cb824',
        session_state: '0817cb9b-c6cc-4ab3-9c62-c2a7d389a5f9',
        code: 'e73df578-7c94-4fcd-9c58-8b74d1cb6e7e.0817cb9b-c6cc-4ab3-9c62-c2a7d389a5f9.e526ffce-229e-48d8-8f5e-4c8593ae0195'
      }

      expect(response).to redirect_to spree.new_spree_user_session_path
      expect(response).to have_http_status(:redirect)
      expect(flash[:success]).to be_nil
      expect(flash[:error]).not_to be_nil
    end
  end
end
