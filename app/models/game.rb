class Game < ActiveRecord::Base
  has_many :game_players
  has_many :players, through: :game_players
  accepts_nested_attributes_for :players
  has_many :turns

  belongs_to :winner, class_name: 'Player'
  belongs_to :loser, class_name: 'Player'

  belongs_to :east_side, class_name: 'Side'
  belongs_to :west_side, class_name: 'Side'

  has_many :team_games
  has_many :teams, through: :team_games
end
