# frozen_string_literal: true

# Validates if a certain user RUN can enter the site
module Cenabast
  module Spree
    module User
      class LoginValidator
        attr_accessor :run, :error_messages

        # @param run [String] run to query, without DV and dots
        def initialize(run)
          @run = run
          @error_messages = []
        end

        # Checks the conditions necessary for allowing a user to enter
        # returns true if conditions met, false if any error exists
        # @return [User] Returns user if the user meets the conditions, nil otherwise
        def call
          rules.each { |rule| send(rule) }

          # return user (valid) if error messages are none
          user unless error_messages.any?
        end

        private

        def user
          @user ||= ::Spree::User.find_by(run: ::Spree::User.raw_run_to_formatted(run))
        end

        def rules
          [
            :user_exists?,
            :user_has_valid_roles?,
            :user_is_valid?
          ]
        end

        def user_exists?
          return true if user

          error_messages << ::Spree.t(:user_does_not_exist_on_system)
        end

        def user_has_valid_roles?
          if user&.has_spree_role?('buyer') || user&.has_spree_role?('provider')
            true
          else
            error_messages << ::Spree.t(:user_does_not_has_valid_roles)
          end
        end

        def user_is_valid?
          if valid_buyer? || valid_provider?
            true
          else
            error_messages << ::Spree.t(:user_not_valid)
          end
        end

        def valid_provider?
          user&.has_spree_role?('provider') && user.vendors&.any?(&:active?)
        end

        def valid_buyer?
          user&.has_spree_role?('buyer') && user&.receivers&.any? && user&.requesters&.any?
        end
      end
    end
  end
end
