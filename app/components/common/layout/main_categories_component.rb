# frozen_string_literal: true

class Common::Layout::MainCategoriesComponent < ApplicationComponent
  # @param categories Spree::Taxonomy collection
  def initialize(categories:)
    super
    @categories = categories
  end

  def taxon_link(taxon)
    "/#{Spree::Config[:storefront_taxons_path]}/#{taxon.permalink}"
  end
end
