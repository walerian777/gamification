class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.persisted?
      can :manage, User, id: user.id
      can :read, :all
    else
      can :read, :all
    end
  end
end
