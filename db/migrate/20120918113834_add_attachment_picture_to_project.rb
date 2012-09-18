class AddAttachmentPictureToProject < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.has_attached_file :picture
    end
  end

  def self.down
    drop_attached_file :projects, :picture
  end
end
