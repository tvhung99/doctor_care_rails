class Admin::AdminController < ApplicationController
  layout "admin"
  before_action :authenticate!
  before_action :redirect_if_not_admin!


  def redirect_if_not_admin!
    redirect_to(root_path) unless current_user.admin?
  end

end