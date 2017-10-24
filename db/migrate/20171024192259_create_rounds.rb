class CreateRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :rounds do |t|
      t.integer :championship_id
      t.datetime :scheduled_date
      t.datetime :actual_date
      t.string :round_status

      t.timestamps
    end
  end
end
