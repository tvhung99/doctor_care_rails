# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    redirect_to admin_path if current_user.present?
    @url = params[:url]
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user&.authenticate(params[:session][:password]) && user&.confirmed?
      log_in user
      check_redirect
    else
      flash.now[:danger] = 'Email hoặc mật khẩu không đúng'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def check_redirect
    unless current_user.admin?
      redirect_to root_path
    else
      redirect_to admin_path
    end

  end
end
