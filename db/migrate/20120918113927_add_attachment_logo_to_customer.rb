class AddAttachmentLogoToCustomer < ActiveRecord::Migration
  def self.up
    change_table :customers do |t|
      t.has_attached_file :logo
    end
  end

  def self.down
    drop_attached_file :customers, :logo
  end
end
