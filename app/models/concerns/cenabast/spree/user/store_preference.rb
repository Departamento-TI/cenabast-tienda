# Module that exposes the methods for handling the current_store Spree:Store, which
# stores are allowed for the user,
# sets the default store when the record is created, and allows to toggle the store
module Cenabast
  module Spree
    module User
      module StorePreference
        extend ActiveSupport::Concern

        included do
          # Relations are not polymorphic, this might need to get adjusted if we
          # want this to work for other models too
          belongs_to :current_store, class_name: 'Spree::Store', optional: true
          has_many :store_users, class_name: 'Cenabast::Spree::StoreUser', foreign_key: :user_id, dependent: :destroy, inverse_of: :user
          has_many :stores, class_name: 'Spree::Store', through: :store_users

          has_many :receiver_users, class_name: 'Cenabast::Spree::ReceiverUser', dependent: :destroy
          has_many :receivers, through: :receiver_users, class_name: 'Cenabast::Spree::Receiver'
          has_many :requesters, through: :receivers, class_name: 'Cenabast::Spree::Requester'
          has_many :company_users, class_name: 'Cenabast::Spree::CompanyUser', dependent: :destroy
          has_many :companies, through: :company_users, class_name: 'Cenabast::Spree::Company'

          before_create :set_current_store
        end

        def availiable_stores
          return ::Spree::Store.all if admin?

          stores
        end

        def toggle_store(store)
          return unless availiable_stores.include? store

          self.current_store = store
          save
        end

        def current_store
          set_current_store && save unless super

          super
        end

        private

        def set_current_store
          store = availiable_stores&.first
          self[:current_store_id] ||= store&.id
        end
      end
    end
  end
end
