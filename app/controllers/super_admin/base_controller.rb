module SuperAdmin
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_super_admin!

    private

    def authorize_super_admin!
      redirect_to root_path, alert: "Access denied." unless current_user&.super_admin?
    end
  end
end