class UniquenessInPlayings < ActiveRecord::Migration[5.1]
  def change
  	add_index :playings, [:team_id, :player_id], unique: true
  end
end
