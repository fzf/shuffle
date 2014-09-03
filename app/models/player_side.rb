class PlayerSide < ActiveRecord::Base
  belongs_to :player
  belongs_to :side
end
