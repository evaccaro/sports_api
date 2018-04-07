class PositionsController < ApplicationController

  def index
    @positions = Position.all
    render json: @positions
  end

 def create
   @position = Position.create(params)
   render json: Position.all
 end

 def show
   @position = Position.find(params[:name])
 end
 
end
