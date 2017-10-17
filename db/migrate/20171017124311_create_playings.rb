class CreatePlayings < ActiveRecord::Migration[5.1]
  def change
    create_table :playings do |t|
      t.integer :player_id
      t.integer :team_id

      t.timestamps
    end
  end
end
