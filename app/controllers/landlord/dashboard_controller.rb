module Landlord
  class DashboardController < BaseController
    def index
      # Example: Fetch properties and leases for the landlord dashboard
      @properties = current_user.properties
    end
  end
end
