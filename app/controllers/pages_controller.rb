class PagesController < ApplicationController
  def dashboard
    @properties = current_user.properties
  end
end
