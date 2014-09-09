class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.integer :points
      t.belongs_to :game
      t.belongs_to :side
      t.belongs_to :winner
      t.belongs_to :loser

      t.timestamps
    end
  end
end
