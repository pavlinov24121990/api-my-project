# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password_digest, :role, :formatted_phone, :name
  
  def formatted_phone
    "+38 (0#{object.phone[0..1]}) #{object.phone[2..4]} #{object.phone[5..6]} #{object.phone[7..8]}"
  end
end
