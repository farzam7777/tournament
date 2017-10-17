class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.date :dob
      t.attachment :photo
      t.string :payer_status
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
