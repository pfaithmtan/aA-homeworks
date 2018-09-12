class User < ApplicationRecord
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true } #need minimum
  before_validation :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    if user && BCrypt::Password.new(user.password_digest).is_password?(password)
      user
    else
      nil
    end
  end

  #helper method -- returns 16-digit pseudorandom string
  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    if self.session_token
      self.session_token
    else
      User.generate_session_token
    end
  end

  #setter method
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
