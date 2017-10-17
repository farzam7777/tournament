class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(current_coach)
      can :create, Team
      can :read, Team

      can :update, Team do |team|
          team.coach == Coach
      end
      
      can :destroy, Team do |team|
          team.coach == Coach
      end
    end
  end
end
