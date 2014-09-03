class CreateSides < ActiveRecord::Migration
  def change
    create_table :sides do |t|
      t.timestamps
    end
  end
end
