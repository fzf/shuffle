class Game < ActiveRecord::Base
  has_many :game_players
  has_many :players, through: :game_players
  accepts_nested_attributes_for :players
  has_many :turns

  belongs_to :winner, class_name: 'Player'
  belongs_to :loser, class_name: 'Player'
end
