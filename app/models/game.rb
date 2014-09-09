class Game < ActiveRecord::Base
  has_many :turns

  belongs_to :winner, class_name: 'Team'
  belongs_to :loser,  class_name: 'Team'

  has_many :players, through: :teams

  has_many :game_sides
  has_many :sides, through: :game_sides
  accepts_nested_attributes_for :sides

  has_many :game_teams
  has_many :teams, through: :game_teams
  accepts_nested_attributes_for :teams

  validates :sides, length: { maximum: 2 }
  validates :teams, length: { maximum: 2, minimum: 1 }
  validates :points, numericality: true

  after_create :create_sides

private
  def create_sides
    if players.count == 2
      sides.create(players: [players.first])
      sides.create(players: [players.last])
    end
  end
end
