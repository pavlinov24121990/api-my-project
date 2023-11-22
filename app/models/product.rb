class Product < ApplicationRecord
  belongs_to :category

  has_many_attached :images

  validates :title, presence: true
  validates :description, presence: true
  validates :price, numericality: { only_integer: true }
end
