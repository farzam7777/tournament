class AddTotalPlayersToTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :players_capacity, :integer, default: 10
  end
end
