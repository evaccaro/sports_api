class Position < ApplicationRecord
  has_many :players
  belongs_to :sport

  validates :name, presence: true, allow_blank: false

  # scope :average_age, -> { joins(:players).where('players.position_id = ?', self.id)}

  # def self.average_age
  #   # sql = "SELECT AVG(players.age) FROM positions JOIN players ON positions.id = players.position_id"
  #   # records_array = ActiveRecord::Base.connection.execute(sql)
  #   # return records_array
  #   # Player.all(:conditions => ["position_id = :position.id"])
  # end
    # Player.average(:age, :conditions => ["position_id = ?", position.id])

  # def self.average_age(position)
  #     Player.where("position_id = ?", position.id).average(:age).round
  # end

  def average_age
    Player.where("position_id = ?", self.id).average(:age).round
  end


end
