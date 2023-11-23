# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pagy::Backend
  require 'pagy/extras/metadata'

  def render_errors(object:)
    render json: { errors: object.errors.full_messages },
           status: :unprocessable_entity
  end

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secret_key_base)
  end
end
