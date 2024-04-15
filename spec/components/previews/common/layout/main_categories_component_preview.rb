class Common::Layout::MainCategoriesComponentPreview < ViewComponent::Preview
  def with_categories(items_quantity: 3)
    categories = mock_categories(items_quantity)
    render Common::Layout::MainCategoriesComponent.new(categories:)
  end

  private

  def mock_categories(items_quantity)
    taxonomy_instances = []

    items_quantity.times do |i|
      taxonomy = Spree::Taxonomy.new
      taxon = Spree::Taxon.new(name: "Name #{i + 1}", permalink: "permalink-#{i + 1}")
      taxonomy.root = taxon
      taxonomy_instances << taxonomy
    end
    taxonomy_instances
  end
end
