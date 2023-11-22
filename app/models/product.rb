class Product < ApplicationRecord
  has_many_attached :images

  validates :title, presence: true 
  validates :description, presence: true
  validates :price, numericality: { only_integer: true }
end
