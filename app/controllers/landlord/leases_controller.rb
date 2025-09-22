module Landlord
  class LeasesController < BaseController
    before_action :set_property
    # before_action :set_tenant
    before_action :set_lease, only: %i[show edit update destroy]

    def index
      @leases = @property.leases
    end

    def new
      @lease = @property.leases.build
      # Alternatively, you can use:
      # @lease = Lease.new
      # @lease.property = @property
      # @lease.tenant = @tenant
      # @lease.landlord = current_user
    end

    def create
      @lease = @property.leases.build(lease_params)
      @lease.landlord_id = current_user.id
      if @lease.save
        redirect_to landlord_property_lease_path(@property, @lease), notice: "Lease created successfully."
      else
        render :new, alert: "Failed to create lease."
      end
    end

    def show
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: "lease_#{@lease.id}",
                 layout: "pdf",
                 page_size: "A4",
                 margin: { top: 20, bottom: 20, left: 20, right: 20 }
        end
      end
    end

    def edit; end

    def update
      if @lease.update(lease_params)
        redirect_to landlord_property_lease_path(@property, @lease), notice: "Lease updated successfully."
      else
        render :edit, alert: "Failed to update lease."
      end
    end

    def destroy
      @lease.destroy
      redirect_to landlord_property_leases_path(@property), notice: "Lease deleted successfully."
    end

    private

    def set_property
      @property = current_user.properties.find(params[:property_id])
    end

    def set_tenant
      @tenant = @property.tenants.find(params[:tenant_id])
    end

    def set_lease
      @lease = @property.leases.find(params[:id])
    end

    def lease_params
      params.require(:lease).permit(:start_date, :end_date, :rent_amount, :security_deposit, :payment_frequency, :tenant_id, :property_id, :landlord_id)
    end
  end
end
