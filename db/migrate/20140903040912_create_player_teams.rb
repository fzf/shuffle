class CreatePlayerTeams < ActiveRecord::Migration
  def change
    create_table :player_teams do |t|
      t.belongs_to :player, index: true
      t.belongs_to :team, index: true

      t.timestamps
    end
  end
end
