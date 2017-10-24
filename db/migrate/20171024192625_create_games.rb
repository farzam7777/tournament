class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :round_id
      t.integer :team1_id
      t.integer :team2_id
      t.integer :team1_score
      t.integer :team2_score
      t.datetime :scheduled_date
      t.datetime :actual_date
      t.string :game_status

      t.timestamps
    end
  end
end
