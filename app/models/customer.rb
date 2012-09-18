class Customer < ActiveRecord::Base
  attr_accessible :name, :website, :logo
  has_attached_file :logo
  validates_presence_of :name, :website, :logo
  validates_attachment :logo, :presence => true
end
