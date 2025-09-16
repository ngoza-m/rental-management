class LeasesController < ApplicationController
  def new
    @tenant = Tenant.find(params[:tenant_id])
    @lease = Lease.new
  end

  def create
    @tenant = Tenant.find(params[:tenant_id])
    @lease = Lease.new(lease_params)
    @lease.tenant = @tenant
    @lease.landlord = current_user

    if @lease.save
      redirect_to tenant_path(@tenant), notice: "Lease created successfully."
    else
      render :new
    end
  end

  def show
    @lease = Lease.find(params[:id])
    @tenant = @lease.tenant
    @property = @lease.property

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "lease_#{@lease.id}",
          layout: 'pdf'
      end
    end
  end

  private

  def lease_params
    params.require(:lease).permit(:property_id, :start_date, :end_date, :rent_amount, :security_deposit, :payment_frequency, :landlord_id, :tenant_id)
  end
end
