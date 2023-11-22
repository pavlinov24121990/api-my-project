# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :products, inverse_of: :category, dependent: :nullify

  has_one_attached :image

  accepts_nested_attributes_for :products

  validates :title, presence: true, length: { minimum: 2, maximum: 20 }
end
