class TurnsController < ApplicationController
  before_action :authenticate_player!

  def create
    @turn = Turn.create(turn_params)
    redirect_to :back
  end

private

  def turn_params
    params[:turn][:creator_id] = current_player.id
    params.require(:turn)
      .permit(:points, :game_id, :side_id, :winner_id, :loser_id, :creator_id)
  end
end
