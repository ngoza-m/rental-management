module Tenant
  class LeasesController < BaseController
    before_action :set_lease, only: [ :show ]

    def index
      @leases = current_user.leases
    end

    def show; end

    private

    def set_lease
      @lease = current_user.leases.find(params[:id])
    end
  end
end
