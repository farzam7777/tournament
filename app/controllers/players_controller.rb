class PlayersController < ApplicationController
  def index
    if coach_signed_in?
      @players = current_coach.players.page(params[:page]).per(3)
    else
      redirect_to root_path, :alert => "You must be Logged in to view Players"
    end
  end

  def new
  	if coach_signed_in?
      @player = Player.new
    else
      redirect_to root_path, :alert => "You must be Logged in to create Players"
    end
  end

  def create
  	@coach = current_coach
    @player = @coach.players.build(player_params)

    if @player.save
      redirect_to player_path(@player), notice: 'Player Successfully Created'
    else
      render :new
    end
  end

  def show
    @player = Player.find(params[:id])
    if !(@player.coach == current_coach)
      redirect_to players_path, alert: 'You are not allowed to access this page.'
    end
  end

  def edit
    @player = Player.find(params[:id])
    if !(@player.coach == current_coach)
      redirect_to players_path, alert: 'You are not allowed to access this page.'
    end
  end

  def update
  	@player = Player.find(params[:id])

    if @player.update_attributes(player_params)
      redirect_to player_path(@player), :notice => "Your Player has been Updated. "
    else 
      render :edit
    end
  end

  def destroy
  	@player = Player.find(params[:id])

    if @player.destroy
      redirect_to players_path, notice: 'Player Successfully Deleted'
    else
      redirect_to player_path(@player), alert: "Couldn't delete, Some problem occured, Try Again"
    end
  end

  private
  	def player_params
  		params.require(:player).permit!
  	end
end
