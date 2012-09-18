class Customer < ActiveRecord::Base
  attr_accessible :name, :website, :logo
  has_attached_file :logo
end
