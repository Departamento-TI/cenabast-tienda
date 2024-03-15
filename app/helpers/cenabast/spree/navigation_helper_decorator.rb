module Cenabast
  module Spree
    module NavigationHelperDecorator
      # Redefine how the cache key is defined for menu sections of spree.
      # Since presentation of header can change receiver/requester
      def spree_menu_cache_key(section = 'header')
        keys = base_cache_key + [
          current_store.cache_key_with_version,
          spree_menu(section)&.cache_key_with_version,
          stores&.maximum(:updated_at),
          spree_current_user&.cache_key_with_version,
          spree_current_user&.current_receiver&.cache_key_with_version,
          spree_current_user&.current_requester&.cache_key_with_version,
          section
        ]
        Digest::MD5.hexdigest(keys.join('-'))
      end
    end
  end
end

not_included = Spree::NavigationHelper.included_modules.exclude?(Cenabast::Spree::NavigationHelperDecorator)
Spree::NavigationHelper.prepend Cenabast::Spree::NavigationHelperDecorator if not_included
