class Team < ActiveRecord::Base
  has_many :player_teams
  has_many :players, through: :player_teams

  has_many :team_games
  has_many :teams, through: :team_games
end
