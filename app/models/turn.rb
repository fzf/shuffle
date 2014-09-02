class Turn < ActiveRecord::Base
  belongs_to :game
  belongs_to :winner
  belongs_to :loser

  after_create :check_winner

private

  def check_winner
    if self.game.turns.where(winner: winner).sum(:points) >= self.game.points
      self.game.update_attributes(
        completed: true,
        winner: winner,
        loser: loser
      )
    end
  end
end
