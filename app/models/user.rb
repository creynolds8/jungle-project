class User < ApplicationRecord
  has_secure_password

  def self.authenticate_with_credentials email, password
    trimmed_email = email.strip.downcase
    user = User.find_by(email: trimmed_email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { in: 8..20 }
  validates :password_confirmation, presence: true
end
