class OpenSource < ActiveRecord::Base
  attr_accessible :facebook_page, :name, :repostory_url, :twitter_username
  validates_presence_of :facebook_page, :name, :repostory_url, :twitter_username
end
