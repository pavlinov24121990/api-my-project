# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password_digest, :role, :phone, :name
end
