class PositionsController < ApplicationController

  def index
    @positions = Position.all
    render json: @positions
  end

 def create
   @position = Position.new(params)
   if @position.valid?
     @position.save
   end
   render json: Position.all
 end

 def show
   @position = Position.find(params[:name])
 end

end
