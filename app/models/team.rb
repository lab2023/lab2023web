class Team < ActiveRecord::Base
  attr_accessible :description, :facebook_username, :github_username, :email, :name, :twitter_username, :avatar,
                  :position, :dudupress_username, :vidipanda_username

  validates_presence_of :description, :facebook_username, :github_username, :email, :name, :twitter_username,
                        :position, :dudupress_username, :vidipanda_username

  validates :email, :uniqueness => true

  has_attached_file :avatar,
                    :default_url => "/assets/missing-image.jpg",
                    :styles => {
                        :small => "200x200#",
                        :medium => "400x400#"
                    },
                    :path => "public/system/:class/:attachment/:style/:sef_file_name.:extension",
                    :url => "/system/:class/:attachment/:style/:sef_file_name.:extension"

  Paperclip.interpolates :sef_file_name do |attachment, style|
    attachment.instance.sef_file_name
  end

  def sef_file_name
    "#{id}-#{name.parameterize}"
  end

  validates_attachment :avatar, :presence => true
end
