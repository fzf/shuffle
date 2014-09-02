class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :game_players
  has_many :games, through: :game_players
  has_many :winning_turns, class_name: Turn, foreign_key: :winner_id
  has_many :losing_turns, class_name: Turn, foreign_key: :losing_id
end
