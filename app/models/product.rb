class Product < ApplicationRecord

  validates :title, presence: true 
  validates :description, presence: true
  validates :price, numericality: { only_integer: true }
end
