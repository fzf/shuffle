class CreateGameSides < ActiveRecord::Migration
  def change
    create_table :game_sides do |t|
      t.belongs_to :game, index: true
      t.belongs_to :side, index: true

      t.timestamps
    end
  end
end
