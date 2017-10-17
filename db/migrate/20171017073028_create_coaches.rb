class CreateCoaches < ActiveRecord::Migration[5.1]
  def change
    create_table :coaches do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :coach_status

      t.timestamps
    end
  end
end
