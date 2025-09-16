module Tenant
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_tenant!

    private

    def authorize_tenant!
      redirect_to root_path, alert: "Access denied." unless current_user&.tenant?
    end
  end
end