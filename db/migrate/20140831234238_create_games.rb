class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :points
      t.boolean :completed, default: false
      t.belongs_to :winner
      t.belongs_to :loser
      t.belongs_to :creator

      t.timestamps
    end
  end
end
