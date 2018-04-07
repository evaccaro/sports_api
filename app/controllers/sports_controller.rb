class SportsController < ApplicationController

  def index
    @sports = Sport.all
    render json: @sports
  end

 def create
   @sport = Sport.create(params)
   render json: Sport.all
 end

 def show
   @sport = Sport.find(params[:name])
 end 

end
