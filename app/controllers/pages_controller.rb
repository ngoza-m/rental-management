class PagesController < ApplicationController
  def dashboard
    @properties = current_user.properties
    @tenants = current_user.tenants
  end
end
