module Landlord
  class DashboardController < BaseController
    def index
      @properties = current_user.properties
      @leases = current_user.leases
    end
  end
end
