class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :game_players
  has_many :games, through: :game_players

  has_many :created_games, class_name: Game, foreign_key: :creator_id
  has_many :created_turns, class_name: Turn, foreign_key: :creator_id
end
