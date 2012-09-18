class Team < ActiveRecord::Base
  attr_accessible :description, :facebook_username, :github_username, :mail, :name, :twitter_username
end
