module Landlord
  class PaymentsController < BaseController
    before_action :set_payment
    before_action :set_lease
    before_action :set_property
    def index
      # Example: Fetch payments for the landlord dashboard
      @payments = @lease.payments
    end

    def show; end

    def new
      @payment = @lease.payments.build
    end

    def create
      @payment = @lease.payments.build(payment_params)
      if @payment.save
        redirect_to landlord_property_lease_payment_path(@property, @lease, @payment), notice: "Payment created successfully."
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def set_property
      @property = current_user.properties.find(params[:property_id])
    end

    def set_lease
      @lease = @property.leases.find(params[:lease_id])
    end

    def set_payment
      @payment = @lease.payments.find(params[:id])
    end

    def payment_params
      params.require(:payment).permit(:amount, :paid_at, :transaction_id, :status)
    end
  end
end
