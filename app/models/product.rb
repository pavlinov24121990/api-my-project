class Product < ApplicationRecord

  validates :title, presence: true 
  validates :description, presence: true
  validates :price, presence: true, format: { with: /\A\d+\z/, message: "должно содержать только цифры" }
end
