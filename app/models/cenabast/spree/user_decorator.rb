module Cenabast
  module Spree
    module UserDecorator
      def self.prepended(base)
        base.devise :database_authenticatable, :rememberable,
                    :trackable # , :omniauthable, omniauth_providers: %i[clave_unica]

        base.include Cenabast::Spree::User::StorePreference
      end

      def full_name
        "#{first_name} #{last_name}".strip
      end
    end
  end
end

not_included = Spree::User.included_modules.exclude?(Cenabast::Spree::UserDecorator)
Spree::User.prepend Cenabast::Spree::UserDecorator if not_included
