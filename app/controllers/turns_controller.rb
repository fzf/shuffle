class TurnsController < ApplicationController
  def create
    @turn = Turn.create(turn_params)
    redirect_to :back
  end

private

  def turn_params
    params.require(:turn).permit(:points, :game_id, :side_id, :winner_id, :loser_id)
  end
end
