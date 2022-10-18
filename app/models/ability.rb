# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.super_admin?
      can :manage, :all
    elsif user.normal_admin?
      can :manage, :all
      cannot :delete, User, { :role_id => [1,2] }
      cannot :update, User, { :role_id => 1 }
      cannot :create, User, { :role_id => 1 }
    end
  end
end
