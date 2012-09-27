class Team < ActiveRecord::Base
  attr_accessible :description, :facebook_username, :github_username, :mail, :name, :twitter_username, :avatar, :position, :dudupress_username, :vidipanda_username
  validates_presence_of :description, :facebook_username, :github_username, :mail, :name, :twitter_username, :position, :dudupress_username, :vidipanda_username
  validates :mail, :uniqueness => true
  has_attached_file :avatar
  validates_attachment :avatar, :presence => true
end
