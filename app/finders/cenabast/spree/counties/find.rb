module Cenabast
  module Spree
    module Counties
      class Find < ::Spree::BaseFinder
        def execute
          scope.
            ransack(params[:filter]).
            result.
            includes(:state).
            order('name ASC')
        end
      end
    end
  end
end
