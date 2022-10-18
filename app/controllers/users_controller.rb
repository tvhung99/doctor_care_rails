# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user, :only => [:index, :edit, :update, :destroy]
  before_action :correct_user, only: :edit
  before_action :admin_user, only: :destroy
  before_action :find_user, :only => [:show, :destroy, :edit, :update]

  def index

  end

  def show
  end



  def admin
  end


end
