class Admin::AdminController < ApplicationController
  before_action :authenticate!
  before_action :destroy_if_not_admin!





  def destroy_if_not_admin!
    redirect_to(root_path) unless current_user.admin?
  end

end