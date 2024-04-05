# Controller to be used for lookbook previewws
# since it heredates from Spree Store controler, we have access to spree
# related helpers
# https://viewcomponent.org/guide/previews.html#configuring-preview-controller
class Cenabast::Spree::PreviewComponentsController < Spree::StoreController
  layout 'spree/layouts/lookbook_layout'

  include ViewComponent::PreviewActions

  def set_locale(&block)
    I18n.with_locale(params[:locale] || I18n.default_locale) do
      block
    end
  end
end
