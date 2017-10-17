module ApplicationHelper
	def current_auth_resource
    if coach_signed_in?
      current_coach
    else
      current_user
    end
  end

  def current_ability
      @current_ability or @current_ability = Ability.new(current_auth_resource)
  end
end
