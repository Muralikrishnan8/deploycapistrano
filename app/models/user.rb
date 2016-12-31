class User < ApplicationRecord

  # authenticate against a BCrypt password
  has_secure_password
  # token authentication
  has_secure_token

  # model validations
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true, case_sensitive: false
end
