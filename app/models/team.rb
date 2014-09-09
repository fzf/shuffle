class Team < ActiveRecord::Base
  has_many :player_teams
  has_many :players, through: :player_teams

  has_many :team_games
  has_many :teams, through: :team_games

  has_many :winning_turns, class_name: Turn, foreign_key: :winner_id
  has_many :losing_turns, class_name: Turn, foreign_key: :losing_id

  validates :color, inclusion: { in: [ 'red', 'blue' ] }
end
