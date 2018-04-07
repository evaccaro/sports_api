class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.string :name
      t.integer :average_age
      t.integer :sport_id
      t.timestamps
    end
  end
end
