# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post
    return unless user.present?
    can [:read, :update, :destroy], :all, user: user
    return unless user.admin?
    can :manage, :all
  end
end
