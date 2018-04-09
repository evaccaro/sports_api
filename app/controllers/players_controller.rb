class PlayersController < ApplicationController

  def index
    @players = Player.all
    render json: @players
  end

 def create
   @player = Player.new(params)
   if @player.valid?
     @player.save
   end
   render json: {
      id: @player.id,
      name_brief: @player.name_brief,
      first_name: @player.first_name,
      last_name: @player.last_name,
      position: @player.position.name,
      age: @player.age,
      average_position_age_diff: @player.average_position_age_diff
     }
 end

 def show
   @player = Player.find(params[:id])
   render json: {
      id: @player.id,
      name_brief: @player.name_brief,
      first_name: @player.first_name,
      last_name: @player.last_name,
      position: @player.position.name,
      age: @player.age,
      average_position_age_diff: @player.average_position_age_diff
     }
 end

end
