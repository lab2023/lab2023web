class Team < ActiveRecord::Base
  attr_accessible :description, :facebook_username, :github_username, :mail, :name, :twitter_username, :avatar
  validates_presence_of :description, :facebook_username, :github_username, :mail, :name, :twitter_username
  validates :mail, :uniqueness => true
  has_attached_file :avatar
  validates_attachment :avatar, :presence => true
end
