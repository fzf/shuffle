class Side < ActiveRecord::Base
  has_one :game
  has_many :player_sides
  has_many :players, through: :player_sides

  has_many :game_sides
  has_many :teams, through: :game_sides

  has_many :turns

  validates :direction, inclusion: { in: [ 'east', 'west' ] }

end
