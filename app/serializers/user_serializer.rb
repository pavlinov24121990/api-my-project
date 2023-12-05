# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password_digest, :role, :formatted_phone, :name, :avatar_url
  
  def formatted_phone
    "+38 (0#{object.phone[0..1]}) #{object.phone[2..4]} #{object.phone[5..6]} #{object.phone[7..8]}"
  end

  def avatar_url
    Rails.application.routes.url_helpers.rails_blob_path(object.avatar, only_path: true)
  end
end
