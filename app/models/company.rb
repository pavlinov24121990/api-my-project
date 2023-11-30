class Company < ApplicationRecord
  
  has_many_attached :images
  has_one_attached :logo


  validates :name, :title, :description, :address, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone,
            format: { with: /\A\d{9}\z/, message: 'valid phone number (0xx) xxx xx xx' }

end
