class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.attachment :team_logo
      t.string :team_status

      t.timestamps
    end
  end
end
