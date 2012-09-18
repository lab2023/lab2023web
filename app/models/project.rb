class Project < ActiveRecord::Base
  attr_accessible :description, :facebook_page, :name, :owner, :twitter_username, :website
end
