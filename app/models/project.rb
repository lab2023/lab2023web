class Project < ActiveRecord::Base
  attr_accessible :description, :facebook_page, :name, :owner, :twitter_username, :website, :project_pictures_attributes

  has_many :project_pictures

  accepts_nested_attributes_for :project_pictures, :allow_destroy => true

  validates_presence_of :description, :facebook_page, :name, :owner, :twitter_username, :website

  extend FriendlyId

  friendly_id :name, use: [:slugged, :history]
end
