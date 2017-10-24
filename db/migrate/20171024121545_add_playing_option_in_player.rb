class AddPlayingOptionInPlayer < ActiveRecord::Migration[5.1]
  def change
  	add_column :players, :playing_option, :string, default: 'one'
  end
end
