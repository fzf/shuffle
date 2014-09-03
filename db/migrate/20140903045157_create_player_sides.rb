class CreatePlayerSides < ActiveRecord::Migration
  def change
    create_table :player_sides do |t|
      t.belongs_to :player, index: true
      t.belongs_to :side, index: true

      t.timestamps
    end
  end
end
