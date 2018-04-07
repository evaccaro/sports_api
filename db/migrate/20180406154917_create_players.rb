class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name_brief
      t.string :first_name
      t.string :last_name
      t.integer :position_id
      t.integer :team_id
      t.integer :age
      t.integer :average_position_age_diff

      t.timestamps
    end
  end
end
