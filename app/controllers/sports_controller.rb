class SportsController < ApplicationController

  def index
    @sports = Sport.all
    render json: @sports
  end

 def create
   @sport = Sport.new(params)
   if @sport.save
   render json: {
      name: @sport.name,
      players: @sport.players.map do |player|
      PlayerSerializer.new(player)
    end
  }
end
 end

 def show
   @sport = Sport.find(params[:id])
   render json: {
      name: @sport.name,
      players: @sport.players.map do |player|
      PlayerSerializer.new(player)
    end
  }
 end

end
