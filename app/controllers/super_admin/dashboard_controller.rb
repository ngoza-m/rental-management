module SuperAdmin
  class DashboardController < BaseController
    def index
      @landlords = User.landlord
      @tenants = User.tenant
      @total_users = User.count
      @total_properties = Property.count
      @total_leases = Lease.count
      @total_payments = Payment.count
    end
  end
end