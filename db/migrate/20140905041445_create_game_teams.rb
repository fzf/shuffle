class CreateGameTeams < ActiveRecord::Migration
  def change
    create_table :game_teams do |t|
      t.belongs_to :game, index: true
      t.belongs_to :team, index: true

      t.timestamps
    end
  end
end
