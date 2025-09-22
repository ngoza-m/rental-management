module Landlord
  class DashboardController < BaseController
    def index
      @properties = current_user.properties
      @leases = Lease.where(landlord_id: current_user.id)
    end
  end
end
