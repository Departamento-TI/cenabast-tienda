class Common::Layout::HeaderComponentPreview < ViewComponent::Preview
  def standard
    render Common::Layout::HeaderComponent.new(
      header_data: {
        current_requester_name: 'SS Met Sur Oriente - 76.817.123-3',
        current_requester_id: 1,
        available_requesters: [
          { id: 1, title: 'SS Met Sur Oriente - 76.817.123-3' },
          { id: 2, title: 'Test - 76.817.123-3' }
        ],
        current_receiver_name: 'Selecciona destinatario',
        current_receiver_id: 1,
        available_receivers: [
          { id: 1, title: 'SS Met Sur Oriente - 76.817.123-3' },
          { id: 2, title: 'Test - 76.817.123-3' }
        ],
        current_store_name: 'Intermediación',
        current_store_id: 1,
        available_stores: [
          { id: 1, title: 'Intermediación' },
          { id: 2, title: 'E-commerce' }
        ],
        categories: mock_categories(3)
      },
      user_data: {
        name: 'John Doe',
        email: 'example@spree.com',
        image_url: 'test-avatar.jpg',
        is_logged_in: true
      }
    )
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
