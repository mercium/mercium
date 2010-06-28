class User < ActiveRecord::Base
  attr_accessible :name, :username, :email
  attr_accessible :password, :password_confirmation
  attr_accessible :remember_me

  devise :database_authenticatable, :recoverable, :rememberable,
         :trackable, :validatable, :lockable

  validates_presence_of :name, :username
  validates_uniqueness_of :username
end
