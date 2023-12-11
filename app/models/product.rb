# frozen_string_literal: true

class Product < ApplicationRecord
  has_many_attached :images

  validates :title, :description, presence: true
  validates :price, numericality: { only_integer: true }

  scope :active_true, -> { where(active: true) }
  scope :active_false, -> { where(active: false) }
end
