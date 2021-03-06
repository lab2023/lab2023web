class OpenSource < ActiveRecord::Base
  attr_accessible :facebook_page, :name, :repository_url, :twitter_username, :description

  validates_presence_of :name, :repository_url

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
