# frozen_string_literal: true

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :price, :image_urls

  def image_urls
    object.images.map do |image|
      Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true)
    end
  end
end
