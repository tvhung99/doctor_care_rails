# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper





  def authenticate!
    return redirect_to login_path unless current_user
    return unless current_user.admin?
  end
  private

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = "Bạn phải đăng nhập."
    redirect_to login_url
  end
end
