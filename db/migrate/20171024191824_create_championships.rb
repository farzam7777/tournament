class CreateChampionships < ActiveRecord::Migration[5.1]
  def change
    create_table :championships do |t|
      t.attachment :logo
      t.string :name
      t.text :description
      t.string :tag_line
      t.string :address
      t.date :date
      t.time :start_time
      t.string :phone
      t.string :email
      t.string :url
      t.date :cutoff_date
      t.integer :number_allowed
      t.integer :tournament_fee
      t.string :tournament_status
      t.integer :sport_id

      t.timestamps
    end
  end
end
