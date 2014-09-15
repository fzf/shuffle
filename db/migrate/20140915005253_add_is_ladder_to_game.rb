class AddIsLadderToGame < ActiveRecord::Migration
  def change
    add_column :games, :is_ladder, :boolean, default: false
  end
end
