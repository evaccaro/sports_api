class SportSerializer < ActiveModel::Serializer
  type :sport

  attributes :name

  has_many :players
  has_many :positions
end
