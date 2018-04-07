class PlayersController < ApplicationController

  def index
    @players = Player.all
    render json: @players
  end

 def create
   @player = Player.create(params)
   render json: Player.all
 end

 def show
   @player = Player.find(params[:id])
 end

end
