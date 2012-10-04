class Project < ActiveRecord::Base
  attr_accessible :description, :facebook_page, :name, :owner, :twitter_username, :website, :project_pictures_attributes, :cover

  has_many :project_pictures

  accepts_nested_attributes_for :project_pictures, :allow_destroy => true

  has_attached_file :cover,
                    :default_url => "/assets/missing-image.jpg",
                    :styles => {
                        :small => "250x250#"
                    },
                    :path => "public/system/:class/:attachment/:style/:sef_file_name.:extension",
                    :url => "/system/:class/:attachment/:style/:sef_file_name.:extension"

  validates_presence_of :description, :facebook_page, :name, :owner, :twitter_username, :website, :cover

  Paperclip.interpolates :sef_file_name do |attachment, style|
    attachment.instance.sef_file_name
  end

  def sef_file_name
    "#{id}-#{name.parameterize}"
  end

  extend FriendlyId

  friendly_id :name, use: [:slugged, :history]
end
