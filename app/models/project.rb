class Project < ActiveRecord::Base
  attr_accessible :description, :facebook_page, :name, :owner, :twitter_username, :website, :picture
  has_attached_file :picture
  validates_presence_of :description, :facebook_page, :name, :owner, :twitter_username, :website
  validates_attachment :picture, :presence => true
end
