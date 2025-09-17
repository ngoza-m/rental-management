module Tenant
  class DashboardController < BaseController
    def index
      @leases = current_user.leases
      @payments = Payment.where(tenant: current_user)
    end
  end
end
