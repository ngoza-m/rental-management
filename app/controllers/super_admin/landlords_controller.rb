module SuperAdmin
  class LandlordsController < BaseController
    def index
      @landlords = User.landlord.where(approved: false)
      @landlords_all = User.landlord.all
    end

    def approve
      @landlord = User.find(params[:id])
      @landlord.update(approved: true)
      redirect_to super_admin_landlords_path, notice: "Landlord approved."
    end

    def reject
      @landlord = User.find(params[:id])
      @landlord.destroy
      redirect_to super_admin_landlords_path, alert: "Landlord rejected and removed."
    end
  end
end
