# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pagy::Backend
  require 'pagy/extras/metadata'

  def render_errors(object:)
    render json: { errors: object.errors.full_messages },
           status: :unprocessable_entity
  end

  def current_userr
    token = request.headers['Authorization']&.split(' ')&.last
    decoded_token = JsonWebToken.decode_token(token)
    user_id = decoded_token[0]['user_id']
    @user = User.find_by(id: user_id)
    render json: { error: 'User not found' }, status: :unauthorized unless user_id.present?
  end
end
