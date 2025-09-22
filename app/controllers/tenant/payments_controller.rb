module Tenant
  class PaymentsController < BaseController
    before_action :set_payment, only: [ :show ]
    before_action :set_lease

    def index
      @payments = @lease.payments
    end

    def show; end

    private

    def set_lease
      @lease = current_user.leases.find(params[:lease_id])
    end

    def set_payment
      @payment = @lease.payments.find(params[:id])
    end
  end
end
