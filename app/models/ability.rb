class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post
    return unless user.present?

    can :manage, :all, user: user
    return unless user.is? :admin

    can :manage, :all
  end
end
