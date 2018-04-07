class TeamsController < ApplicationController

  def index
    @teams = Team.all
    render json: @teams
  end

 def create
   @team = Team.create(params)
   render json: Team.all
 end

 def show
   @team = Team.find(params[:name])
 end 

end
