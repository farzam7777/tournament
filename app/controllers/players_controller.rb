class PlayersController < ApplicationController
  def index
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
  end

  def edit
  	
  end

  def update
  	
  end

  def destroy
  	
  end

  private
  	def player_params
  		params.require(:player).permit!
  	end
end
