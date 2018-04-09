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
   render json: {
     id: @position.id,
     name: @position.name,
     average_age: @position.average_age
     }
 end

 def show
   @position = Position.find(params[:name])
   render json: {
     id: @position.id,
     name: @position.name,
     average_age: @position.average_age
     }
 end

end
