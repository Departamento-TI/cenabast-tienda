module Cenabast
  module Spree
    module UserDecorator
      def self.prepended(base)
        base.include Cenabast::Spree::HasRun
        base.include Cenabast::Spree::User::StorePreference
        base.include Cenabast::Spree::CancelValidation

        base.cancel_validates :password, :password_confirmation
        base.cancel_validates :email

        base.devise :omniauthable, omniauth_providers: %i[clave_unica]
      end

      def full_name
        "#{first_name} #{last_name}".strip
      end
    end
  end
end

not_included = Spree::User.included_modules.exclude?(Cenabast::Spree::UserDecorator)
Spree::User.prepend Cenabast::Spree::UserDecorator if not_included
