class Team < ActiveRecord::Base
  attr_accessible :description, :facebook_username, :github_username, :mail, :name, :twitter_username, :avatar
  has_attached_file :avatar
end
