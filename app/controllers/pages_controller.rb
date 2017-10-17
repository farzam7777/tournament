class PagesController < ApplicationController
  def my_team
  	redirect_to teams_path, notice: 'coming here'
  end
end
