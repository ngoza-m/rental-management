module Landlord
  class PropertiesController < BaseController
    before_action :set_property, only: %i[show edit update destroy]

    def index
      @properties = current_user.properties
    end

    def show; end

    def new
      @property = current_user.properties.new
    end

    def create
      @property = current_user.properties.new(property_params)
      if @property.save
        redirect_to landlord_property_path(@property), notice: "Property created successfully."
      else
        render :new, alert: "Failed to create property."
      end
    end

    def edit; end

    def update
      if @property.update(property_params)
        redirect_to landlord_property_path(@property), notice: "Property updated successfully."
      else
        render :edit, alert: "Failed to update property."
      end
    end

    def destroy
      @property.destroy
      redirect_to landlord_properties_path, notice: "Property deleted successfully."
    end

    private

    def set_property
      @property = current_user.properties.find(params[:id])
    end

    def property_params
      params.require(:property).permit(:name, :address, :description, :rent)
    end
  end
end
