# frozen_string_literal: true
class Contact < ApplicationRecord
  # Validations
  validates :first_name, :last_name, :phone, presence: true
  validates :phone, numericality: true
  validate :check_email

  protected

  # Check Email addresses between contacts must be unique
  def check_email
    if email.blank?
      errors.add(:email, 'Email is required to save your contacts')
    elsif !(email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)
      errors.add(:email, 'Invalid email format')
    elsif Contact.exists?(email: email, user_id: user_id)
      errors.add(:email, 'Email is already added into your contacts')
    end
  end
end
