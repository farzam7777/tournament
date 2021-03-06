class TeamsController < ApplicationController
  def index
    @teams = Team.all.page(params[:page]).per(2)
  end

  def new
    if coach_signed_in?
      @team = Team.new
    else
      redirect_to teams_path, :alert => "You must be Logged in to create your Team"
    end
  end

  def create
    @coach = current_coach
    @team = @coach.teams.build(team_params)

    total_players = params[:team][:total_players]
    
    if total_players.to_i <= 10
      if @team.save
        redirect_to team_path(@team), notice: 'Team Successfully Created'
      else
        render :new
      end
    else
      redirect_to new_team_path, alert: "You have exceeded your Players Capacity for this Team. "
    end

    rescue ActiveRecord::RecordNotUnique 
      flash[:alert] = 'Unable to create Team with same Players' 
      render :new 
  end

  def edit
    @team = Team.find(params[:id])
    if !(@team.coach == current_coach)
      redirect_to team_path(@team), alert: 'You are not authorized to access this page'
    end
  end

  def update
    @team = Team.find(params[:id])

    total_players = params[:team][:total_players]
    players_capacity = @team.players_capacity

    if total_players.to_i <= players_capacity.to_i
      if @team.update_attributes(team_params)
        redirect_to team_path, :notice => "Your Team has been Updated. "
      else 
        render :edit
      end
    else
      redirect_to edit_team_path(@team), alert: "You have exceeded your Players Capacity for this Team. "
    end

    rescue ActiveRecord::RecordNotUnique 
      flash[:alert] = 'Unable to update team with same Players' 
      render :edit
  end

  def show
    @team = Team.find(params[:id])
  end

  def destroy
    @team = Team.find(params[:id])

    if !(@team.coach == current_coach)
      redirect_to team_path(@team), alert: 'You are not authorized to access this page'
    end

    if @team.destroy
      redirect_to teams_path, notice: 'Team Successfully Deleted'
    else
      redirect_to team_path(@team), alert: "Couldn't delete, Some problem occured, Try Again"
    end
  end

  def my_team 
    @teams = current_coach.teams
  end

  private
    def team_params
      params.require(:team).permit(:team_name, :team_logo, :coach_id, :team_status, :sport_id, playings_attributes: [:id, :team_id, :player_id, :sport_id, :_destroy])
    end
end
