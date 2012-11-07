class AddAttachmentPictureToWorks < ActiveRecord::Migration
  def self.up
    change_table :works do |t|
      t.has_attached_file :picture
    end
  end

  def self.down
    drop_attached_file :works, :picture
  end
end
