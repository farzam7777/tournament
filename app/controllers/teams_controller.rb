class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @coach = current_coach
    @team = @coach.teams.build(team_params)
    if @team.save
      redirect_to team_path(@team), notice: 'Team Successfully Created'
    else
      render :new
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])

    if @team.update_attributes(team_params)
      redirect_to team_path, :notice => "Your Team has been Updated. "
    else 
      render :edit
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def destroy
    @team = Team.find(params[:id])
    if @team.destroy
      redirect_to teams_path, notice: 'Team Successfully Deleted'
    else
      redirect_to team_path(@team), notice: "Couldn't delete, Some problem occured, Try Again"
    end
  end

  private
    def team_params
      params.require(:team).permit(:team_name, :team_logo, :coach_id, :team_status, players_attributes: [:id, :team_id, :first_name, :last_name, :phone, :email, :dob, :photo, :player_status, :_destroy])
    end
end
