module Landlord
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_landlord!

    private

    def authorize_landlord!
      redirect_to root_path, alert: "Access denied." unless current_user&.landlord?
    end
  end
end