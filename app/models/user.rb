class User < ActiveRecord::Base
  attr_accessible :password
  before_save :encrypt_password

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hashed = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
