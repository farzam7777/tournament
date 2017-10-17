class RenameColumnInPlayers < ActiveRecord::Migration[5.1]
  def change
  	rename_column :players, :payer_status, :player_status
  end
end
