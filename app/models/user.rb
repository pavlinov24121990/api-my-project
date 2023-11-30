# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_one_attached :avatar

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :phone,
            format: { with: /\A\d{9}\z/, message: 'valid phone number (0xx) xxx xx xx' }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_confirmation, presence: true

  enum role: { user: 0, admin: 1 }
end
