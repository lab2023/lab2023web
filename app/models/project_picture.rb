class ProjectPicture < ActiveRecord::Base
  belongs_to :project
  attr_accessible :image

  has_attached_file :image,
                    :default_url => "/assets/missing-image.jpg",
                    :styles => {
                        :small => "200x200#",
                        :large => "600x600#"
                    },
                    :path => "public/system/:class/:attachment/:style/:sef_file_name.:extension",
                    :url => "/system/:class/:attachment/:style/:sef_file_name.:extension"

  Paperclip.interpolates :sef_file_name do |attachment, style|
    attachment.instance.sef_file_name
  end

  def sef_file_name
    "#{id}-#{project.name.parameterize}"
  end
end
