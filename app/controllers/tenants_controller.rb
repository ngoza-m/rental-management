class TenantsController < ApplicationController
  def index
    @tenants = Tenant.where(landlord: current_user)
  end

  def show
    @tenant = Tenant.find(params[:id])
  end

  def new
    @tenant = Tenant.new
  end

  def create
    @tenant = Tenant.new(tenant_params)
    @tenant.landlord = current_user
    if @tenant.save
      redirect_to @tenant
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @tenant = Tenant.find(params[:id])
  end

  def update
    @tenant = Tenant.find(params[:id])
    if @tenant.update(tenant_params)
      redirect_to @tenant
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tenant = Tenant.find(params[:id])
    @tenant.destroy
    redirect_to tenants_path, status: :see_other
  end

  private

  def tenant_params
    params.require(:tenant).permit(:name, :id_number, :contact, :emergency_contact)
  end

end
