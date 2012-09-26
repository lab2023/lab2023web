class Team < ActiveRecord::Base
  attr_accessible :description, :facebook_username, :github_username, :mail, :name, :twitter_username, :avatar
  validates_presence_of :description, :facebook_username, :github_username, :mail, :name, :twitter_username, :avatar
  validates :mail, :uniqueness => true
  has_attached_file :avatar
end
