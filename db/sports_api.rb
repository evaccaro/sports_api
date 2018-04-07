require 'net/http'
require 'open-uri'
require 'json'

 class GetSport


  def get_sport_players(sport)
    url = "http://api.cbssports.com/fantasy/players/list?version=3.0&SPORT=#{sport}&response_format=JSON"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body
  end


  def positions(sport)
    players = JSON.parse(self.get_sport_players(sport))
    players["body"]["players"].collect do |player|
      player["position"]
    end
  end

  def teams(sport)
    players = JSON.parse(self.get_sport_players(sport))
    players["body"]["players"].collect do |player|
      player["pro_team"]
    end
  end

end

#do in seed file
#use map not each
# sports = ["football", "basketball", "baseball"]
# sports_players = sports.map { |sport|  GetSport.new.get_sport_players(sport)}
# puts sports_players
# posts = sports.map { |sport| sports_players.positions(sport).uniq}
# puts posts

# programs = GetSport.new
# puts sports.map { |sport|  programs.positions(sport).uniq}

# programs = GetSport.new
# puts sports.map { |sport|  programs.teams(sport).uniq}
