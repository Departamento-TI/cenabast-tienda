# Module that exposes the methods for handling the current_receiver Cenabast::Spree::Receiver, which
# receivers/stores/requesters are allowed for the user,
# This also defines relations with receivers, requesters, companies for the user.
# sets the default receiver when the record is created, and allows to toggle the store
module Cenabast
  module Spree
    module User
      module StorePreference
        extend ActiveSupport::Concern

        included do
          # Relations are not polymorphic, this might need to get adjusted if we
          # want this to work for other models too
          belongs_to :current_receiver, class_name: 'Cenabast::Spree::Receiver', optional: true

          has_many :store_users, class_name: 'Cenabast::Spree::StoreUser', foreign_key: :user_id, dependent: :destroy, inverse_of: :user
          has_many :stores, class_name: 'Spree::Store', through: :store_users

          has_many :receiver_users, class_name: 'Cenabast::Spree::ReceiverUser', dependent: :destroy
          has_many :receivers, through: :receiver_users, class_name: 'Cenabast::Spree::Receiver'
          has_many :requesters, through: :receivers, class_name: 'Cenabast::Spree::Requester'
          has_many :company_users, class_name: 'Cenabast::Spree::CompanyUser', dependent: :destroy
          has_many :companies, through: :company_users, class_name: 'Cenabast::Spree::Company'

          before_create :set_current_receiver
        end

        # For every requester linked should be pickable
        def available_requesters
          return ::Spree::Requester.all if admin?

          requesters
        end

        # Only the receivers enabled for that requester should be pickable
        def available_receivers
          return ::Spree::Receiver.all if admin?

          matching_receivers_for_requester(current_requester)
        end

        # For the same receiver run, see what stores has available
        def available_stores
          receivers.where(run: current_receiver.run).map(&:store).uniq
        end

        # Toggles the receiver, the requester and store are based upon this entity
        def toggle_receiver(receiver)
          return unless receivers.include? receiver

          self.current_receiver = receiver
          save
        end

        # Toggling this will change the receiver for the first available receiver of that requester
        def toggle_requester(requester)
          return unless requesters.include? requester
          return unless matching_receivers_for_requester(requester).any?

          self.current_receiver = matching_receivers_for_requester(requester).first
          save
        end

        # This will try to change to another receiver that matches the same
        # run but has a different spree store assigned
        def toggle_store(store)
          return unless available_stores.include? store

          receiver = receivers.find_by(run: current_receiver.run, store:)

          self.current_receiver = receiver
          save
        end

        def current_receiver
          set_current_receiver && save unless receivers.find_by(id: self[:current_receiver_id])

          receivers.find_by(id: self[:current_receiver_id])
        end

        def current_requester
          current_receiver&.requester
        end

        def current_store
          current_receiver&.store
        end

        private

        # Match receivers that belong to user but also belong to requester
        def matching_receivers_for_requester(requester)
          requester.receivers.where(id: receivers.pluck(:id))
        end

        def set_current_receiver
          receiver = receivers&.first
          self[:current_receiver_id] ||= receiver&.id
        end
      end
    end
  end
end
