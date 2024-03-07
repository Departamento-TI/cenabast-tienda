# Concern for adding generic attributes needed for
# nested values destroy logic in the json permitted params
module Cenabast
  module Spree
    module HasDependantDestroyAttributesJsonApi
      extend ActiveSupport::Concern

      included do
        def self.json_api_permitted_attributes
          super + ['id', '_destroy']
        end
      end
    end
  end
end
