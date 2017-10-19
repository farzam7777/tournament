class AddCoachIdToPlayer < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :coach_id, :integer
  end
end
