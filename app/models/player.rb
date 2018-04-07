class Player < ApplicationRecord
  belongs_to :team
  belongs_to :position

  def self.name_brief(team, player)
    if (team.sport_id === 1)
      return "#{player["firstname"][0]}. #{player["lastname"]}"
    elsif (team.sport_id === 2)
      return "#{player["firstname"]} #{player["lastname"][0]}."
    elsif (team.sport_id === 3)
      return "#{player["firstname"][0]}. #{player["lastname"][0]}."
    end
  end
end
