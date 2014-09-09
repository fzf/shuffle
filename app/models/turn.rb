class Turn < ActiveRecord::Base
  belongs_to :game
  belongs_to :side

  belongs_to :winner, class_name: 'Team'
  belongs_to :loser, class_name: 'Team'
  belongs_to :creator, class_name: 'Player'

  after_create :check_winner

private

  def check_winner
    if self.game.turns.where(winner: self.winner).sum(:points) >= self.game.points
      self.game.update_attributes(
        completed: true,
        winner: self.winner,
        loser: self.loser
      )
    end
  end
end
