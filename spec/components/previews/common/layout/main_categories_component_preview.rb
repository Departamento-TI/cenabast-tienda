class Common::Layout::MainCategoriesComponentPreview < ViewComponent::Preview
  def with_categories
    categories = Spree::Taxonomy.all
    render Common::Layout::MainCategoriesComponent.new(categories:)
  end
end
