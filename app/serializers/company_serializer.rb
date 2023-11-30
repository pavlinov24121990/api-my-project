# frozen_string_literal: true

class CompanySerializer < ActiveModel::Serializer
  attributes :title, :description, :name, :image_urls, :formatted_phone, :address, :email, :logo_url

  def image_urls
    object.images.map do |image|
      Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true)
    end
  end

  def logo_url
    Rails.application.routes.url_helpers.rails_blob_path(object.logo, only_path: true)
  end

  def formatted_phone
    "+38 (0#{object.phone[0..1]}) #{object.phone[2..4]} #{object.phone[5..6]} #{object.phone[7..8]}"
  end
end
