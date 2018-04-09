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
# grab all players from API endpoint
#iterate through sports, then through players from API to create Team, Position, and Player objects
#update Position and Player objects with average ages after they've been created

sports.each do |sport|
  sport_inst = Sport.create(name: sport)
  sports_players = GetSport.new.get_sport_players(sport)
  sports_players.each do |player|
  team = Team.find_or_create_by(name: player["pro_team"], sport: sport_inst)
  position = Position.find_or_create_by(name: player["position"], sport: sport_inst)
  player = Player.create(name_brief: Player.name_brief(team, player), first_name: player["firstname"], last_name: player["lastname"], position: position, age: player["age"], team: team)
  end
end

Position.all.each do |position|
  if position.players.length > 0
    position.update(average_age: Position.average_age(position))
  end
end

Player.all.each do |player|
  if player["age"] != nil
    player.update(average_position_age_diff: Player.average_position_age_diff(player))
  end
end
