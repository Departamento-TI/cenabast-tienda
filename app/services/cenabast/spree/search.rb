module Cenabast
  module Spree
    # Implemented based on Spree::Core::Search::Base
    # Search class compatible with spree_frontend entry params.
    # Will return an activerecord collection of results upon #retrieve_products call.
    class Search
      attr_accessor :properties, :current_user, :current_currency, :current_store, :taxon

      def initialize(params)
        @properties = {}
        @current_store = params[:current_store] || ::Spree::Store.default
        @current_currency = @current_store.default_currency
        @taxon = params[:taxon]

        prepare(params)
      end

      def retrieve_products
        @products = extended_base_scope
      end

      def method_missing(name)
        if @properties.key? name
          @properties[name]
        else
          super
        end
      end

      def respond_to_missing?(name, include_private = false)
        @properties.key?(name) || super
      end

      protected

      def extended_base_scope
        ::Spree::Product.search(
          '*',
          **query
        )
      end

      def query
        {
          where: query_where_params,
          order: query_sort_mode,
          includes: query_includes,
          page: page || 1,
          per_page:
        }.compact_blank!
      end

      def query_where_params
        {
          store_ids: [current_store.id],
          _and: [
            { _or:
              [
                { discontinue_on: nil },
                { discontinue_on: { gt: Time.now.in_time_zone } }
              ] },
            { _or: query_or_conditions }
          ].compact_blank!,
          currency: current_currency,
          taxon_ids: [taxon&.id].compact,
          price:,
          option_value_ids: option_value_ids.compact,
          properties_id: product_properties,
        }.compact_blank!
      end

      def query_sort_mode
        if keywords
          { _score: :desc }
        else
          { name_zcen: { order: 'asc' } }
        end
      end

      def query_or_conditions
        or_conditions = []

        if keywords
          or_conditions << { zgen: { ilike: "%#{keywords}%" } }
          or_conditions << { zcen: { ilike: "%#{keywords}%" } }
          or_conditions << { name_zcen: { ilike: "%#{keywords}%" } }
          or_conditions << { name_zgen: { ilike: "%#{keywords}%" } }
        end

        or_conditions.compact
      end

      def query_includes
        [
          :tax_category,
          { variants: [
            { images: { attachment_attachment: :blob } }
          ] },
          { master: [
            :prices,
            { images: { attachment_attachment: :blob } }
          ] }
        ]
      end

      def get_price_range(price_param)
        return if price_param.blank?

        less_than_string = I18n.t('activerecord.attributes.spree/product.less_than')

        if price_param.include? less_than_string
          low_price = 0
          high_price = Monetize.parse(price_param.remove("#{less_than_string} ")).to_i
        else
          low_price, high_price = Monetize.parse_collection(price_param).map(&:to_i)
          high_price = 99_999_999 if high_price&.zero?
        end

        low_price..high_price
      end

      def build_option_value_ids(params)
        filter_params = ::Spree::OptionType.filterable.map(&:filter_param)

        filter_params.filter_map do |filter_param|
          params[filter_param]
        end.compact
      end

      def prepare(params)
        @properties[:keywords] = params[:keywords]
        @properties[:option_value_ids] = build_option_value_ids(params)
        @properties[:price] = get_price_range(params[:price])
        @properties[:search] = params[:search]
        @properties[:sort_by] = params[:sort_by] || 'default'
        @properties[:include_images] = params[:include_images]

        per_page = params[:per_page].to_i
        @properties[:per_page] = per_page.positive? ? per_page : ::Spree::Config[:products_per_page]
        @properties[:page] = if params[:page].respond_to?(:to_i)
                               params[:page].to_i <= 0 ? 1 : params[:page].to_i
                             else
                               1
                             end
        @properties[:product_properties] = params[:properties]
      end
    end
  end
end
