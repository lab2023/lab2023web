class AddAttachmentAvatarToTeam < ActiveRecord::Migration
  def self.up
    change_table :teams do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :teams, :avatar
  end
end
