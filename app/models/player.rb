class Player < ApplicationRecord
  belongs_to :team
  belongs_to :position

  validates :first_name, presence: true, allow_blank: false


  def self.name_brief(team, player)
    if (team.sport_id === 1)
      return "#{player["firstname"][0]}. #{player["lastname"]}"
    elsif (team.sport_id === 2)
      return "#{player["firstname"]} #{player["lastname"][0]}."
    elsif (team.sport_id === 3)
      return "#{player["firstname"][0]}. #{player["lastname"][0]}."
    end
  end

  def self.average_position_age_diff(player)
      avg_for_position = Position.where("id = ?", player)[0]
      player_age = player[:age]
    if avg_for_position != nil
      if avg_for_position.average_age != nil
        return player_age-avg_for_position.average_age
      end
    end
  end


end
