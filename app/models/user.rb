require 'bcrypt'

class User < ActiveRecord::Base

  # include BCrypt

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :username, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

end
