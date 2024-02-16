module RedirectToRoot
  extend ActiveSupport::Concern

  included do
    # Block every action, redirect to root path
    before_action :redirect_to_root
  end

  private

  def redirect_to_root
    redirect_to spree.root_path
  end
end
