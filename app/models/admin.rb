class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :timeoutable, :registerable, :validatable, :rememberable, :recoverable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :remember_me, :name, :password_confirmation
  # attr_accessible :title, :body
end