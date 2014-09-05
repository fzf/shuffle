class GameSide < ActiveRecord::Base
  belongs_to :game
  belongs_to :side
end
