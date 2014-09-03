class Side < ActiveRecord::Base
  has_one :game
  has_many :player_sides
  has_many :players, through: :player_sides
end
