class OpenSource < ActiveRecord::Base
  attr_accessible :facebook_page, :name, :repostory_url, :twitter_username, :description

  validates_presence_of :facebook_page, :name, :repostory_url, :twitter_username

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
