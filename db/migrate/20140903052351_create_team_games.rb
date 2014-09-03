class CreateTeamGames < ActiveRecord::Migration
  def change
    create_table :team_games do |t|
      t.belongs_to :team, index: true
      t.belongs_to :game, index: true

      t.timestamps
    end
  end
end
