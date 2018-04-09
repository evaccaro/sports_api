class PositionSerializer < ActiveModel::Serializer
  attributes :id, :name, :average_age
  has_many :players
end
