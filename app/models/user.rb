class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :birthdate, :password
  attr_accessor :password

  validates_presence_of(:password, :on => "create")

  before_save :encrypt_password

  def self.authenticate_by_email(email, password)
    user = find_by_email(email)
    if user && user.password_hashed == BCrypt::Engine.hash_secret(password, user.password_salt)
      user[:authenticated] = true
    else
      user[:authenticated] = false
    end
    return user
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hashed = BCrypt::Engine.hash_secret(password, self.password_salt)
    end
  end
end
