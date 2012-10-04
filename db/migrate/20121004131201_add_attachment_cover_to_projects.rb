class AddAttachmentCoverToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.has_attached_file :cover
    end
  end

  def self.down
    drop_attached_file :projects, :cover
  end
end
