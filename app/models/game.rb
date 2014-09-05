class Game < ActiveRecord::Base
  has_many :turns

  belongs_to :winner, class_name: 'Team'
  belongs_to :loser,  class_name: 'Team'

  has_many :game_players
  has_many :players, through: :game_players
  accepts_nested_attributes_for :players

  has_many :game_sides
  has_many :sides, through: :game_sides

  has_many :game_teams
  has_many :teams, through: :game_teams
end
