class ApplicationComponent < ViewComponent::Base
  include ApplicationController::HelperMethods
  include ActionDispatch::Routing::RouteSet::MountedHelpers
end
