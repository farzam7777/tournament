class AddSportIdToPlaying < ActiveRecord::Migration[5.1]
  def change
    add_column :playings, :sport_id, :integer
  end
end
