class GamesController < ApplicationController
  before_action :authenticate_player!
  before_action :set_game, only: [:show, :configure, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
    if @game.completed?
      @title = "Game Completed"
      render :completed
    elsif @game.sides.empty?
      redirect_to [:configure, @game]
    else
      if @game.turns.empty?
        @side = @game.sides.sample
      else
        @side = (@game.sides - [@game.turns.last.side]).first
      end

      @title              = "#{@side.direction.humanize} Side"

      @blue_team         = @game.teams.where(color: 'blue').first
      @red_team          = @game.teams.where(color: 'red').first

      @blue_player       = @side.players.where(id: [@blue_team.players.pluck(:id)]).first
      @red_player        = @side.players.where(id: [@red_team.players.pluck(:id)]).first

      @blue_team_points  = @blue_team.winning_turns.where(game: @game).sum(:points)
      @red_team_points   = @red_team.winning_turns.where(game: @game).sum(:points)
    end
  end

  def configure
    @title = "Choose Sides"
    @teams = @game.teams
    @sides = [Side.new(direction: 'east'), Side.new(direction: 'west')]
  end

  # GET /games/new
  def new
    @game = Game.new(
      points: 11,
      teams: [
        Team.new(color: 'red'),
        Team.new(color: 'blue')
      ]
    )
    @players = Player.all
  end

  # GET /games/1/edit
  def edit
    @players = Player.all
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def game_params
    params[:game][:creator_id] = current_player.id
    params.require(:game).permit(
      :points,
      :creator_id,
      :is_ladder,
      player_ids: [],
      teams_attributes: [
        :color,
        player_ids: []
      ],
      sides_attributes: [
        :direction,
        player_ids: []
      ]
    )
  end
end
