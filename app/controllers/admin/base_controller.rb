module Admin
  class BaseController < AuthenticatedController
    before_action :authenticate_admin!
  end
end
