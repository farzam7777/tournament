class AddAttachmentImageToCoaches < ActiveRecord::Migration[5.1]
  def self.up
    change_table :coaches do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :coaches, :image
  end
end
