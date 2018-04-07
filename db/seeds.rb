require 'net/http'
require 'open-uri'
require 'json'

 class GetSport


  def get_sport_players(sport)
    url = "http://api.cbssports.com/fantasy/players/list?version=3.0&SPORT=#{sport}&response_format=JSON"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    players = JSON.parse(response.body)
    players["body"]["players"]
  end


  def positions(sport)
    players = self.get_sport_players(sport)
    players.collect do |player|
      player["position"]
    end
  end

  def teams(sport)
    players = self.get_sport_players(sport)
    players.collect do |player|
      player["pro_team"]
    end
  end

end

sports = ["football", "basketball", "baseball"]


#create sport objects using above array
# grab all players

Sport.destroy_all
Team.destroy_all


# name_brief: Player.name_brief(player)

sports.each do |sport|
  sport_inst = Sport.create(name: sport)
  sports_players = GetSport.new.get_sport_players(sport)
  sports_players.each do |player|
  team = Team.find_or_create_by(name: player["pro_team"], sport: sport_inst)
  position = Position.find_or_create_by(name: player["position"], average_age: Player.where("position_id = ?", player["position"].id).average(:age), sport: sport_inst)
  player = Player.create(name_brief: Player.name_brief(team, player), first_name: player["firstname"], last_name: player["lastname"], position: position, age: player["age"], team: team)
  # team.players << Player.create()
  end
end

byebug


#create player objects
# sports_players.each do |player|
#   Player.create(first_name: player["firstname"], last_name: player["lastname"], age: player["age"])


#create teams from newly created sport objects
# teams = sports_players.map { |player| Team.find_or_create_by(name: player["pro_team"], sport_id: Sport.where("name = ?", )) }