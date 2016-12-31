# frozen_string_literal: true
class User < ApplicationRecord
  # authenticate against a BCrypt password
  has_secure_password
  # token authentication
  has_secure_token

  # model validations
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true, case_sensitive: false

  # To form json data
  def to_json
    {
      first_name: first_name,
      last_name: last_name,
      email: email
    }
  end
end
