class Customer < ActiveRecord::Base
  attr_accessible :title, :first_name, :last_name
  attr_accessible :email, :password, :password_confirmation, :remember_me

  devise :database_authenticatable, :registerable, :confirmable,
         :lockable, :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name

  def formal_name(options = {})
    title? ? "#{title} #{options[:short] ? last_name : full_name}" : name(options)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def initial
    first_name.first
  end

  def name(options = {})
    options[:short] ? short_name : full_name
  end

  def short_name
    "#{initial} #{last_name}"
  end
end
